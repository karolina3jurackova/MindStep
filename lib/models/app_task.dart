class AppTask {
  final String id;
  final String name;
  final String description;
  final int durationMinutes;
  final int totalDays;

  /// Flat list — items at [day-1]*2 and [day-1]*2+1 are shown together on that day.
  final List<String> dailyFacts;

  /// Stable practical tips shown in the Tips bottom sheet.
  final List<String> tips;

  const AppTask({
    required this.id,
    required this.name,
    required this.description,
    required this.durationMinutes,
    required this.totalDays,
    required this.dailyFacts,
    required this.tips,
  });

  /// Returns two facts for the given day (1-indexed).
  /// Second fact may be empty if the list has an odd number of entries.
  ({String fact1, String fact2}) getDayContent(int currentDay) {
    final idx = ((currentDay - 1) * 2).clamp(0, dailyFacts.length);
    return (
      fact1: idx < dailyFacts.length ? dailyFacts[idx] : '',
      fact2: (idx + 1) < dailyFacts.length ? dailyFacts[idx + 1] : '',
    );
  }
}
