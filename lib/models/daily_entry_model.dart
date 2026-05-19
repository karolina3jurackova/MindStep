import 'package:cloud_firestore/cloud_firestore.dart';

class DailyEntryModel {
  final String taskName;
  final String taskDescription;
  final int moodIndex; // 0=sad 1=neutral 2=smile(happy) 3=excited
  final String? note;
  final int durationMinutes;
  final DateTime completedAt;
  final String category;
  final String dateKey; // 'yyyy-MM-dd'

  static const List<String> moodAssets = ['sad', 'neutral', 'smile', 'excited'];
  static const List<String> moodLabels = ['Smutný', 'Neutrální', 'Šťastný', 'Nadšený'];

  const DailyEntryModel({
    required this.taskName,
    required this.taskDescription,
    required this.moodIndex,
    this.note,
    required this.durationMinutes,
    required this.completedAt,
    required this.category,
    required this.dateKey,
  });

  String get moodAsset => moodAssets[moodIndex.clamp(0, 3)];
  String get moodLabel => moodLabels[moodIndex.clamp(0, 3)];

  factory DailyEntryModel.fromMap(Map<String, dynamic> map, String docId) =>
      DailyEntryModel(
        taskName: (map['taskName'] as String?) ?? '',
        taskDescription: (map['taskDescription'] as String?) ?? '',
        moodIndex: (map['moodIndex'] as num?)?.toInt() ?? 0,
        note: map['note'] as String?,
        durationMinutes: (map['durationMinutes'] as num?)?.toInt() ?? 0,
        completedAt: map['completedAt'] != null
            ? (map['completedAt'] as Timestamp).toDate()
            : DateTime.now(),
        category: (map['category'] as String?) ?? '',
        dateKey: (map['dateKey'] as String?) ?? docId,
      );

  Map<String, dynamic> toMap() => {
        'taskName': taskName,
        'taskDescription': taskDescription,
        'moodIndex': moodIndex,
        'note': note,
        'durationMinutes': durationMinutes,
        'completedAt': Timestamp.fromDate(completedAt),
        'category': category,
        'dateKey': dateKey,
      };
}
