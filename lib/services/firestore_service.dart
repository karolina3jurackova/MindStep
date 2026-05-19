import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../models/daily_entry_model.dart';
import '../models/task_progress_model.dart';
import '../models/app_task.dart';
import '../models/custom_task_model.dart';
import '../data/task_registry.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;
  FirestoreService._internal() {
    // Disk persistence: all Firestore data is saved locally.
    // Reads work offline from disk, writes are queued and auto-synced when back online.
    _db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // In-memory caches — cleared when user changes
  String? _cachedUid;
  Map<String, TaskProgressModel>? _progressCache;
  List<DailyEntryModel>? _entriesCache;
  List<CustomTaskModel>? _customTasksCache;

  void _syncUser() {
    final uid = _uid;
    if (uid != _cachedUid) {
      _progressCache = null;
      _entriesCache = null;
      _customTasksCache = null;
      _cachedUid = uid;
    }
  }

  String? get _uid => _auth.currentUser?.uid;

  DocumentReference? get _userDoc =>
      _uid != null ? _db.collection('users').doc(_uid) : null;

  CollectionReference? get _entriesCol => _userDoc?.collection('entries');
  CollectionReference? get _progressCol => _userDoc?.collection('taskProgress');
  CollectionReference? get _cancelledAttemptsCol =>
      _userDoc?.collection('cancelledAttempts');
  CollectionReference? get _customTasksCol =>
      _userDoc?.collection('customTasks');

  static String dateKey(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  Future<void> completeTaskAndSaveReflection({
    required String taskName,
    required String taskDescription,
    required int moodIndex,
    String? note,
    required int durationMinutes,
    required String category,
  }) async {
    final doc = _userDoc;
    final col = _entriesCol;
    if (doc == null || col == null) {
      throw Exception('User not authenticated');
    }

    final now = DateTime.now();
    final todayKey = dateKey(now);
    final today = DateTime(now.year, now.month, now.day);

    // Read is graceful — offline disk cache or assume not done
    bool alreadyCompletedToday = false;
    try {
      final existing =
          await col.where('dateKey', isEqualTo: todayKey).limit(1).get();
      alreadyCompletedToday = existing.docs.isNotEmpty;
    } catch (_) {}

    final entry = DailyEntryModel(
      taskName: taskName,
      taskDescription: taskDescription,
      moodIndex: moodIndex,
      note: (note == null || note.trim().isEmpty) ? null : note.trim(),
      durationMinutes: durationMinutes,
      completedAt: now,
      category: category,
      dateKey: todayKey,
    );

    // Critical write — propagates exceptions so the UI knows if it failed.
    // When offline, Firestore queues this locally and resolves successfully.
    // When online with wrong rules, this throws and prevents navigation to home.
    await col.add(entry.toMap());
    _entriesCache = null;

    if (!alreadyCompletedToday) {
      int currentStreak = 0;
      int longestStreak = 0;
      DateTime? lastCompleted;

      try {
        final userSnap = await doc.get();
        if (userSnap.exists) {
          final model =
              UserModel.fromMap(userSnap.data() as Map<String, dynamic>);
          currentStreak = model.currentStreak;
          longestStreak = model.longestStreak;
          lastCompleted = model.lastCompletedDate;
        }
      } catch (_) {}

      if (lastCompleted == null) {
        currentStreak = 1;
      } else {
        final lastDay = DateTime(
            lastCompleted.year, lastCompleted.month, lastCompleted.day);
        final diff = today.difference(lastDay).inDays;
        if (diff == 1) {
          currentStreak += 1;
        } else if (diff > 1) {
          currentStreak = 1;
        }
      }

      if (currentStreak > longestStreak) longestStreak = currentStreak;

      // Critical write — propagates exceptions
      await doc.set({
        'currentStreak': currentStreak,
        'longestStreak': longestStreak,
        'lastCompletedDate': Timestamp.fromDate(now),
      }, SetOptions(merge: true));
    }
  }

  Future<void> saveAvatar(String assetName) async {
    final doc = _userDoc;
    if (doc == null) return;
    try {
      await doc.set({'avatarAsset': assetName}, SetOptions(merge: true));
    } catch (_) {}
  }

  // Real-time stream — emits last cached value when offline
  Stream<UserModel> streamUserData() {
    final doc = _userDoc;
    if (doc == null) return Stream.value(UserModel.empty());
    return doc.snapshots().handleError((_) {}).map((snap) {
      if (!snap.exists) return UserModel.empty();
      return UserModel.fromMap(snap.data() as Map<String, dynamic>);
    });
  }

  Future<List<DailyEntryModel>> getEntriesForMonth(
      int year, int month) async {
    final col = _entriesCol;
    if (col == null) return [];
    try {
      final start = dateKey(DateTime(year, month, 1));
      final end = dateKey(DateTime(year, month + 1, 1));
      final snap = await col
          .where('dateKey', isGreaterThanOrEqualTo: start)
          .where('dateKey', isLessThan: end)
          .get();
      return snap.docs
          .map((d) =>
              DailyEntryModel.fromMap(d.data() as Map<String, dynamic>, d.id))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<Map<String, TaskProgressModel>> getAllTaskProgress() async {
    _syncUser();
    if (_progressCache != null) return _progressCache!;

    final col = _progressCol;
    if (col == null) return {};

    try {
      final snap = await col.get();
      final result = <String, TaskProgressModel>{};
      for (final doc in snap.docs) {
        result[doc.id] = TaskProgressModel.fromMap(
            doc.id, doc.data() as Map<String, dynamic>);
      }
      _progressCache = result;
      return result;
    } catch (_) {
      // No network and no disk cache — return empty (first launch offline)
      _progressCache = {};
      return {};
    }
  }

  Future<TaskProgressModel> getTaskProgress(String taskId) async {
    final cached = (await getAllTaskProgress())[taskId];
    return cached ?? TaskProgressModel.initial(taskId);
  }

  Future<void> markTaskActiveForToday(String taskId) async {
    final col = _progressCol;
    if (col == null) return;
    final today = dateKey(DateTime.now());

    _progressCache ??= {};
    final existing = _progressCache![taskId];
    // Generate a stable instanceId on the first interaction with this task attempt.
    final instanceId = existing?.instanceId ?? col.doc().id;
    _progressCache![taskId] = TaskProgressModel(
      taskId: taskId,
      instanceId: instanceId,
      currentDay: existing?.currentDay ?? 1,
      lastCompletedDate: existing?.lastCompletedDate,
      markedActiveDate: today,
      status: existing?.status ?? 'active',
    );

    try {
      await col.doc(taskId).set(
          {'markedActiveDate': today, 'status': 'active', 'instanceId': instanceId},
          SetOptions(merge: true));
    } catch (_) {}
  }

  Future<void> updateTaskProgress(String taskId, int nextDay) async {
    final col = _progressCol;
    if (col == null) return;
    final today = dateKey(DateTime.now());

    // Update in-memory cache immediately so UI reflects change without waiting
    _progressCache ??= {};
    final existing = _progressCache![taskId];
    // Generate a stable instanceId on the first completion if not already set.
    final instanceId = existing?.instanceId ?? col.doc().id;
    _progressCache![taskId] = TaskProgressModel(
      taskId: taskId,
      instanceId: instanceId,
      currentDay: nextDay,
      lastCompletedDate: today,
      markedActiveDate: existing?.markedActiveDate,
    );

    // Write to Firestore — queued offline and synced when back online
    try {
      await col.doc(taskId).set({
        'currentDay': nextDay,
        'lastCompletedDate': today,
        'status': 'active',
        'instanceId': instanceId,
      });
    } catch (_) {
      // Already in memory cache — will sync to Firestore when online
    }
  }

  static const int _maxActiveTasks = 2;

  bool _isTaskActive(TaskProgressModel progress, int totalDays) {
    final hasStarted =
        progress.currentDay > 1 || progress.lastCompletedDate != null;
    final notCompleted = progress.currentDay <= totalDays;
    final notCancelled = progress.status != 'cancelled';
    return hasStarted && notCompleted && notCancelled;
  }

  Future<int> countActiveTasks() async {
    final progress = await getAllTaskProgress();
    final customTasks = await _loadCustomTasks();
    int count = 0;
    for (final entry in progress.entries) {
      AppTask? task = getTaskById(entry.key);
      if (task == null) {
        for (final ct in customTasks) {
          if (ct.taskId == entry.key) {
            task = ct.toAppTask();
            break;
          }
        }
      }
      if (task != null && _isTaskActive(entry.value, task.totalDays)) {
        count++;
      }
    }
    return count;
  }

  Future<bool> canStartNewTask() async {
    return (await countActiveTasks()) < _maxActiveTasks;
  }

  Future<int> getCancelledTaskCount() async {
    final col = _cancelledAttemptsCol;
    if (col == null) return 0;
    try {
      final snap = await col.get();
      return snap.docs.length;
    } catch (_) {
      // Offline with no disk cache — fall back to in-memory status count
      final progress = await getAllTaskProgress();
      return progress.values.where((p) => p.status == 'cancelled').length;
    }
  }

  Future<void> cancelTask(String taskId) async {
    final progressCol = _progressCol;
    final attemptsCol = _cancelledAttemptsCol;
    if (progressCol == null) return;

    _progressCache ??= {};
    final existing = _progressCache![taskId];
    final dayReached = existing?.currentDay ?? 1;
    final instanceId = existing?.instanceId;

    // Update in-memory cache: mark cancelled, preserve progress snapshot
    _progressCache![taskId] = TaskProgressModel(
      taskId: taskId,
      instanceId: instanceId,
      currentDay: dayReached,
      lastCompletedDate: existing?.lastCompletedDate,
      status: 'cancelled',
    );

    try {
      // Persist the cancelled attempt for statistics history.
      // instanceId links this record back to the specific attempt that was cancelled.
      await attemptsCol?.add({
        'taskId': taskId,
        'instanceId': instanceId,
        'dayReached': dayReached,
        'cancelledAt': dateKey(DateTime.now()),
      });
      // Mark the live progress document as cancelled
      await progressCol.doc(taskId).set(
          {'status': 'cancelled'}, SetOptions(merge: true));
    } catch (_) {}
  }

  /// Resets a previously cancelled task to day 1 so the user can start fresh.
  /// The cancelled attempt history in [_cancelledAttemptsCol] is preserved.
  /// A new [instanceId] is generated so this attempt is distinguishable from
  /// all previous ones in the history.
  Future<void> restartTask(String taskId) async {
    final col = _progressCol;
    if (col == null) return;

    final newInstanceId = col.doc().id;

    _progressCache ??= {};
    _progressCache![taskId] = TaskProgressModel(
      taskId: taskId,
      instanceId: newInstanceId,
      currentDay: 1,
      lastCompletedDate: null,
      status: 'active',
    );

    try {
      await col.doc(taskId).set({
        'currentDay': 1,
        'lastCompletedDate': null,
        'status': 'active',
        'instanceId': newInstanceId,
      });
    } catch (_) {}
  }

  Future<List<CustomTaskModel>> _loadCustomTasks() async {
    _syncUser();
    if (_customTasksCache != null) return _customTasksCache!;

    final col = _customTasksCol;
    if (col == null) return [];

    try {
      final snap = await col.get();
      _customTasksCache = snap.docs
          .map((d) =>
              CustomTaskModel.fromMap(d.id, d.data() as Map<String, dynamic>))
          .toList();
      return _customTasksCache!;
    } catch (_) {
      _customTasksCache = [];
      return [];
    }
  }

  Future<List<AppTask>> getCustomTasksForCategory(String category) async {
    final all = await _loadCustomTasks();
    return all
        .where((t) => t.category == category)
        .map((t) => t.toAppTask())
        .toList();
  }

  Future<AppTask> saveCustomTask({
    required String name,
    required String description,
    required String category,
    required int durationMinutes,
    required int totalDays,
  }) async {
    final col = _customTasksCol;
    if (col == null) throw Exception('Not authenticated');

    final docRef = col.doc();
    final task = CustomTaskModel(
      taskId: docRef.id,
      taskName: name,
      taskDescription: description,
      category: category,
      durationMinutes: durationMinutes,
      totalDays: totalDays,
      createdAt: DateTime.now(),
    );

    await docRef.set(task.toMap());
    _customTasksCache = null;
    return task.toAppTask();
  }

  Future<List<DailyEntryModel>> getAllEntries() async {
    _syncUser();
    if (_entriesCache != null) return _entriesCache!;

    final col = _entriesCol;
    if (col == null) return [];

    try {
      final snap = await col.orderBy('dateKey').get();
      _entriesCache = snap.docs
          .map((d) =>
              DailyEntryModel.fromMap(d.data() as Map<String, dynamic>, d.id))
          .toList();
      return _entriesCache!;
    } catch (_) {
      // No network and no disk cache — return empty
      _entriesCache = [];
      return [];
    }
  }
}
