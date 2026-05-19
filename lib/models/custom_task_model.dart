import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adv_basics/models/app_task.dart';

class CustomTaskModel {
  final String taskId;
  final String taskName;
  final String taskDescription;
  final String category; // 'habit' | 'communication'
  final int durationMinutes;
  final int totalDays;
  final DateTime createdAt;

  const CustomTaskModel({
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.category,
    required this.durationMinutes,
    required this.totalDays,
    required this.createdAt,
  });

  AppTask toAppTask() => AppTask(
        id: taskId,
        name: taskName,
        description: taskDescription,
        durationMinutes: durationMinutes,
        totalDays: totalDays,
        dailyFacts: const [],
        tips: const [],
      );

  Map<String, dynamic> toMap() => {
        'taskId': taskId,
        'taskName': taskName,
        'taskDescription': taskDescription,
        'category': category,
        'durationMinutes': durationMinutes,
        'totalDays': totalDays,
        'createdAt': Timestamp.fromDate(createdAt),
        'isCustom': true,
      };

  factory CustomTaskModel.fromMap(String docId, Map<String, dynamic> map) =>
      CustomTaskModel(
        taskId: docId,
        taskName: (map['taskName'] as String?) ?? '',
        taskDescription: (map['taskDescription'] as String?) ?? '',
        category: (map['category'] as String?) ?? 'habit',
        durationMinutes: (map['durationMinutes'] as num?)?.toInt() ?? 10,
        totalDays: (map['totalDays'] as num?)?.toInt() ?? 7,
        createdAt: map['createdAt'] != null
            ? (map['createdAt'] as Timestamp).toDate()
            : DateTime.now(),
      );
}
