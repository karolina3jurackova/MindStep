import 'package:adv_basics/models/app_task.dart';
import 'package:adv_basics/data/habit_tasks.dart';
import 'package:adv_basics/data/communication_tasks.dart';

AppTask? getTaskById(String id) {
  for (final t in habitTasks) {
    if (t.id == id) return t;
  }
  for (final t in communicationTasks) {
    if (t.id == id) return t;
  }
  return null;
}
