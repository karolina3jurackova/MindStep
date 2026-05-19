import 'package:adv_basics/models/task_args.dart';

class TaskData {
  final String name;
  final String shortDescription;
  final String detail;
  final List<String> tips;
  final int durationMinutes;
  final int goalDays;
  final String category;

  const TaskData({
    required this.name,
    required this.shortDescription,
    required this.detail,
    required this.tips,
    required this.durationMinutes,
    required this.goalDays,
    required this.category,
  });

  TaskArgs toTaskArgs({String taskId = '', int currentDay = 1}) => TaskArgs(
        taskId: taskId,
        taskName: name,
        taskDescription: shortDescription,
        durationMinutes: durationMinutes,
        category: category,
        currentDay: currentDay,
        totalDays: goalDays,
      );
}
