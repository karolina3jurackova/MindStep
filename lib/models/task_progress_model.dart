class TaskProgressModel {
  final String taskId;
  final int currentDay;
  final String? lastCompletedDate;
  final String? markedActiveDate; // date user tapped "I'll try this today"
  final String status; // 'active', 'cancelled'
  final String? instanceId; // unique ID per attempt; preserved in cancelledAttempts history

  const TaskProgressModel({
    required this.taskId,
    required this.currentDay,
    this.lastCompletedDate,
    this.markedActiveDate,
    this.status = 'active',
    this.instanceId,
  });

  factory TaskProgressModel.initial(String taskId) =>
      TaskProgressModel(taskId: taskId, currentDay: 1);

  Map<String, dynamic> toMap() => {
        'currentDay': currentDay,
        'lastCompletedDate': lastCompletedDate,
        'markedActiveDate': markedActiveDate,
        'status': status,
        'instanceId': instanceId,
      };

  factory TaskProgressModel.fromMap(String taskId, Map<String, dynamic> map) =>
      TaskProgressModel(
        taskId: taskId,
        currentDay: (map['currentDay'] as int?) ?? 1,
        lastCompletedDate: map['lastCompletedDate'] as String?,
        markedActiveDate: map['markedActiveDate'] as String?,
        status: (map['status'] as String?) ?? 'active',
        instanceId: map['instanceId'] as String?,
      );
}
