import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:adv_basics/data/communication_tasks.dart';
import 'firestore_service.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();

  static GlobalKey<NavigatorState>? navigatorKey;

  static const _channelGeneral = 'mindstep_general';
  static const _channelComm = 'mindstep_comm';

  static const _morningId = 1;
  static const _afternoonId = 2;
  static const _commId = 3;
  static const _eveningId = 4;
  static const _commEveningId = 5;

  static const _kMorning = 'notif_morning';
  static const _kAfternoon = 'notif_afternoon';
  static const _kEvening = 'notif_evening';
  static const _kComm = 'notif_comm';

  Future<void> init() async {
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: _handleTap,
    );
  }

  void _handleTap(NotificationResponse response) {
    final nav = navigatorKey?.currentState;
    if (nav == null) return;
    if (response.payload == 'comm') {
      nav.pushNamed('/communication');
    } else {
      nav.pushNamed('/home');
    }
  }

  Future<bool> requestPermission() async {
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final iosGranted =
        await ios?.requestPermissions(alert: true, badge: true, sound: true) ??
            true;
    final androidGranted =
        await android?.requestNotificationsPermission() ?? true;
    return iosGranted && androidGranted;
  }

  Future<NotifSettings> loadSettings() async {
    final p = await SharedPreferences.getInstance();
    return NotifSettings(
      morningEnabled: p.getBool(_kMorning) ?? false,
      afternoonEnabled: p.getBool(_kAfternoon) ?? false,
      eveningEnabled: p.getBool(_kEvening) ?? false,
      communicationEnabled: p.getBool(_kComm) ?? false,
    );
  }

  Future<void> persistSettings(NotifSettings s) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kMorning, s.morningEnabled);
    await p.setBool(_kAfternoon, s.afternoonEnabled);
    await p.setBool(_kEvening, s.eveningEnabled);
    await p.setBool(_kComm, s.communicationEnabled);
  }

  Future<void> applySettings(NotifSettings s) async {
    await _applySettings(s);
  }

  Future<void> saveSettings(NotifSettings s) async {
    await persistSettings(s);
    await _applySettings(s);
  }

  Future<void> _applySettings(NotifSettings s) async {
    await _plugin.cancel(_morningId);
    await _plugin.cancel(_afternoonId);
    await _plugin.cancel(_commId);
    await _plugin.cancel(_commEveningId);
    await _plugin.cancel(_eveningId);

    if (s.morningEnabled) {
      await _schedule(
        id: _morningId,
        hour: 9,
        minute: 0,
        title: 'Začni svůj den 🌱',
        body: 'Tvůj denní návyk na tebe čeká.',
        channelId: _channelGeneral,
        payload: 'general',
      );
    }
    if (s.afternoonEnabled) {
      await _schedule(
        id: _afternoonId,
        hour: 13,
        minute: 0,
        title: 'Dnes je ještě čas ⏰',
        body: 'Ještě jsi nic nedokončil – i malý krok se počítá.',
        channelId: _channelGeneral,
        payload: 'general',
      );
    }
    if (s.eveningEnabled) {
      await _schedule(
        id: _eveningId,
        hour: 19,
        minute: 0,
        title: 'Jak ti to šlo dnes? 🌙',
        body: 'Zamysli se nad svým pokrokem.',
        channelId: _channelGeneral,
        payload: 'evening',
      );
    }
    if (s.communicationEnabled) {
      await _scheduleComm();
    }
  }

  Future<void> _scheduleComm() async {
    final today = FirestoreService.dateKey(DateTime.now());
    bool hasActiveTodayComm = false;
    String title = 'Komunikační praxe 💬';
    String body = 'Podívej se na svou dnešní komunikační výzvu.';

    try {
      final progress = await FirestoreService().getAllTaskProgress();
      for (final entry in progress.entries) {
        final taskId = entry.key;
        final p = entry.value;
        final taskIndex =
            communicationTasks.indexWhere((t) => t.id == taskId);
        if (taskIndex == -1) continue;
        final task = communicationTasks[taskIndex];
        final isActive =
            p.status != 'cancelled' && p.currentDay <= task.totalDays;
        if (!isActive) continue;
        // Only send notifications when user explicitly started today's day.
        if (p.markedActiveDate != today) continue;

        hasActiveTodayComm = true;
        final content = task.getDayContent(p.currentDay);
        if (content.fact1.isNotEmpty) {
          title = task.name;
          final raw = content.fact1;
          body = raw.length > 100 ? '${raw.substring(0, 97)}...' : raw;
        }
        break;
      }
    } catch (_) {}

    await _plugin.cancel(_commId);
    await _plugin.cancel(_commEveningId);

    if (!hasActiveTodayComm) return;

    await _schedule(
      id: _commId,
      hour: 13,
      minute: 30,
      title: title,
      body: body,
      channelId: _channelComm,
      payload: 'comm',
      repeat: false,
    );

    await _schedule(
      id: _commEveningId,
      hour: 19,
      minute: 0,
      title: 'Čas na reflexi 🌙',
      body: 'Jak se ti dnes dařilo s komunikační výzvou?',
      channelId: _channelComm,
      payload: 'comm',
      repeat: false,
    );
  }

  /// Call this after user taps "Zkusím to dnes" to activate today's comm notifications.
  Future<void> scheduleCommNotificationsForToday() async {
    final settings = await loadSettings();
    if (!settings.communicationEnabled) return;
    await _scheduleComm();
  }

  Future<void> _schedule({
    required int id,
    required int hour,
    required int minute,
    required String title,
    required String body,
    required String channelId,
    required String payload,
    bool repeat = true,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      if (!repeat) return; // one-time notification whose time already passed — skip
      scheduled = scheduled.add(const Duration(days: 1));
    }

    final channelName = channelId == _channelComm
        ? 'Komunikační připomínky'
        : 'Denní připomínky';

    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: 'MindStep $channelName',
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: const DarwinNotificationDetails(),
    );

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      scheduled,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: repeat ? DateTimeComponents.time : null,
      payload: payload,
    );
  }
}

class NotifSettings {
  final bool morningEnabled;
  final bool afternoonEnabled;
  final bool eveningEnabled;
  final bool communicationEnabled;

  const NotifSettings({
    required this.morningEnabled,
    required this.afternoonEnabled,
    required this.eveningEnabled,
    required this.communicationEnabled,
  });

  bool get anyEnabled =>
      morningEnabled || afternoonEnabled || eveningEnabled || communicationEnabled;

  NotifSettings copyWith({
    bool? morningEnabled,
    bool? afternoonEnabled,
    bool? eveningEnabled,
    bool? communicationEnabled,
  }) =>
      NotifSettings(
        morningEnabled: morningEnabled ?? this.morningEnabled,
        afternoonEnabled: afternoonEnabled ?? this.afternoonEnabled,
        eveningEnabled: eveningEnabled ?? this.eveningEnabled,
        communicationEnabled: communicationEnabled ?? this.communicationEnabled,
      );
}
