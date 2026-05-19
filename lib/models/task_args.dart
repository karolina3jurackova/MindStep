class TaskArgs {
  final String taskId;
  final String taskName;
  final String taskDescription;
  final int durationMinutes;
  final String category;
  final int currentDay;
  final int totalDays;

  const TaskArgs({
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.durationMinutes,
    required this.category,
    required this.currentDay,
    required this.totalDays,
  });
}
