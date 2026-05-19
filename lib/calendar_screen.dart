import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_calendar.dart';
import 'package:adv_basics/models/daily_entry_model.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  int? _selectedDay;
  late Future<List<DailyEntryModel>> _entriesFuture;

  @override
  void initState() {
    super.initState();
    _entriesFuture = _loadEntries();
  }

  Future<List<DailyEntryModel>> _loadEntries() => FirestoreService()
      .getEntriesForMonth(_currentMonth.year, _currentMonth.month);

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _selectedDay = null;
      _entriesFuture = _loadEntries();
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _selectedDay = null;
      _entriesFuture = _loadEntries();
    });
  }

  String get _monthLabel {
    const months = [
      'Leden',
      'Únor',
      'Březen',
      'Duben',
      'Květen',
      'Červen',
      'Červenec',
      'Srpen',
      'Září',
      'Říjen',
      'Listopad',
      'Prosinec'
    ];
    return '${months[_currentMonth.month - 1]} ${_currentMonth.year}';
  }

  List<DateTime?> _buildCalendarDays() {
    final firstDay = DateTime(_currentMonth.year, _currentMonth.month, 1);
    int weekdayOffset = firstDay.weekday - 1;
    final daysInMonth =
        DateUtils.getDaysInMonth(_currentMonth.year, _currentMonth.month);
    final List<DateTime?> days =
        List.filled(weekdayOffset, null, growable: true);
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(_currentMonth.year, _currentMonth.month, i));
    }
    while (days.length % 7 != 0) {
      days.add(null);
    }
    return days;
  }

  String _formatSelectedDate() {
    if (_selectedDay == null) return '';
    final date =
        DateTime(_currentMonth.year, _currentMonth.month, _selectedDay!);
    const weekdays = [
      'Pondělí',
      'Úterý',
      'Středa',
      'Čtvrtek',
      'Pátek',
      'Sobota',
      'Neděle'
    ];
    const months = [
      'ledna',
      'února',
      'března',
      'dubna',
      'května',
      'června',
      'července',
      'srpna',
      'září',
      'října',
      'listopadu',
      'prosince'
    ];
    return '${weekdays[date.weekday - 1]}, $_selectedDay. ${months[date.month - 1]} ${date.year}';
  }

  Widget _moodStat(String label) {
    return Text(
      label,
      style: GoogleFonts.josefinSans(
          color: const Color(0xFF6E3E09),
          fontSize: 14,
          fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    final calendarDays = _buildCalendarDays();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 232, 205),
      body: CustomPaint(
        painter: ShapeCalendarPainter(),
        child: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: FutureBuilder<List<DailyEntryModel>>(
                future: _entriesFuture,
                builder: (context, snapshot) {
                  final entries = snapshot.data ?? [];

                  // Build lookup: day number → list of all entries that day
                  final Map<int, List<DailyEntryModel>> dayEntryMap = {};
                  for (final e in entries) {
                    final day = int.parse(e.dateKey.split('-')[2]);
                    dayEntryMap.putIfAbsent(day, () => []).add(e);
                  }
                  final activeDays = dayEntryMap.keys.toSet();

                  // Mood counts for the displayed month
                  final moodCounts = List.filled(4, 0);
                  for (final e in entries) {
                    moodCounts[e.moodIndex.clamp(0, 3)]++;
                  }

                  final selectedEntries =
                      _selectedDay != null ? (dayEntryMap[_selectedDay] ?? []) : <DailyEntryModel>[];

                  return SizedBox.expand(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 110),
                      child: Column(
                        children: [
                          // MONTH SWITCHER
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3DC),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: _previousMonth,
                                  child: const Icon(Icons.chevron_left,
                                      color: Color(0xFF6E3E09), size: 24),
                                ),
                                Text(
                                  _monthLabel,
                                  style: GoogleFonts.judson(
                                      color: const Color(0xFF40260A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: _nextMonth,
                                  child: const Icon(Icons.chevron_right,
                                      color: Color(0xFF6E3E09), size: 24),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // KALENDÁR
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3DC),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ],
                            ),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 7,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              childAspectRatio: 1,
                              children: [
                                // Day letter headers
                                ...['P', 'Ú', 'S', 'Č', 'P', 'S', 'N']
                                    .map((d) => Center(
                                          child: Text(
                                            d,
                                            style: GoogleFonts.josefinSans(
                                              color: const Color(0xFF9E7A50),
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        )),
                                // Day cells
                                ...calendarDays.map((day) {
                                  if (day == null) return const SizedBox();
                                  final dayNum = day.day;
                                  final isSelected = _selectedDay == dayNum;
                                  final isActive = activeDays.contains(dayNum);
                                  final isToday =
                                      day.year == DateTime.now().year &&
                                          day.month == DateTime.now().month &&
                                          day.day == DateTime.now().day;

                                  return GestureDetector(
                                    onTap: isActive
                                        ? () => setState(() {
                                              _selectedDay =
                                                  _selectedDay == dayNum
                                                      ? null
                                                      : dayNum;
                                            })
                                        : null,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: isToday
                                            ? const Color.fromARGB(
                                                255, 163, 186, 137)
                                            : isActive
                                                ? const Color(0xFFE39A5C)
                                                    .withValues(
                                                        alpha: isSelected
                                                            ? 0.35
                                                            : 0.18)
                                                : Colors.transparent,
                                        border: (!isToday && !isActive)
                                            ? Border.all(
                                                color: const Color(0xFFE8D5BC),
                                                width: 1)
                                            : null,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Text(
                                            '$dayNum',
                                            style: GoogleFonts.judson(
                                              color: isToday
                                                  ? const Color(0xFFFFF8EB)
                                                  : isActive
                                                      ? const Color(0xFFC87A3A)
                                                      : const Color(0xFF6E3E09),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          if (isActive && !isToday)
                                            Positioned(
                                              bottom: 4,
                                              child: Container(
                                                width: 4,
                                                height: 4,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFC87A3A),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // MOOD PILULKA
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3DC),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _moodStat('${moodCounts[0]} Smutný'),
                                _moodStat('${moodCounts[1]} Neutrální'),
                                _moodStat('${moodCounts[2]} Šťastný'),
                                _moodStat('${moodCounts[3]} Nadšený'),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          // AKTÍVNE DNI PILULKA
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3DC),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.06),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3))
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/fire.png',
                                    width: 20, height: 20),
                                const SizedBox(width: 8),
                                Text(
                                  '${activeDays.length} ${activeDays.length == 1 ? 'aktivní den' : 'aktivních dní'}',
                                  style: GoogleFonts.josefinSans(
                                      color: const Color(0xFF6E3E09),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 12),

                          // DETAIL DŇA
                          if (_selectedDay != null &&
                              selectedEntries.isNotEmpty) ...[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF3DC),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.06),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3))
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // DÁTUM
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today_outlined,
                                          size: 16, color: Color(0xFF6E3E09)),
                                      const SizedBox(width: 8),
                                      Text(
                                        _formatSelectedDate(),
                                        style: GoogleFonts.judson(
                                            color: const Color(0xFF40260A),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  const Divider(
                                      color: Color(0xFFE8D5B5), thickness: 1),

                                  // One block per completed task
                                  ...selectedEntries.asMap().entries.map((e) {
                                    final i = e.key;
                                    final entry = e.value;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),

                                        // MOOD
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/${entry.moodAsset}.png',
                                              width: 32,
                                              height: 32,
                                              errorBuilder: (_, __, ___) =>
                                                  const Icon(
                                                      Icons.sentiment_satisfied,
                                                      color: Color(0xFFD3A06B),
                                                      size: 32),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'NÁLADA',
                                                  style: GoogleFonts.josefinSans(
                                                      color:
                                                          const Color(0xFF9E7A50),
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                                Text(
                                                  entry.moodLabel,
                                                  style: GoogleFonts.judson(
                                                      color: const Color(
                                                          0xFF40260A),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        // POZNÁMKA
                                        if (entry.note != null &&
                                            entry.note!.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            entry.note!,
                                            style: GoogleFonts.judson(
                                                color: const Color.fromARGB(
                                                    255, 116, 90, 59),
                                                fontSize: 17,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],

                                        const SizedBox(height: 10),

                                        // TASK
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 28,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: entry.category == 'habit'
                                                    ? const Color(0xFF9DAE7A)
                                                    : const Color(0xFFD3A06B),
                                              ),
                                              child: const Icon(Icons.check,
                                                  color: Colors.white,
                                                  size: 16),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    entry.category == 'habit'
                                                        ? 'Návyk splněn'
                                                        : 'Komunikační úkol splněn',
                                                    style: GoogleFonts.judson(
                                                        color: const Color(
                                                            0xFF40260A),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    entry.taskName,
                                                    style: GoogleFonts.judson(
                                                        color: entry.category ==
                                                                'habit'
                                                            ? const Color
                                                                .fromARGB(255,
                                                                107, 136, 78)
                                                            : const Color(
                                                                0xFFBF8040),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.access_time,
                                                          size: 14,
                                                          color:
                                                              Color(0xFF9E7A50)),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        '${entry.durationMinutes} min',
                                                        style: GoogleFonts
                                                            .josefinSans(
                                                                color: const Color(
                                                                    0xFF9E7A50),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Divider between entries (not after last)
                                        if (i < selectedEntries.length - 1) ...[
                                          const SizedBox(height: 12),
                                          const Divider(
                                              color: Color(0xFFE8D5B5),
                                              thickness: 1),
                                        ],
                                      ],
                                    );
                                  }),
                                  const SizedBox(height: 6),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],

                          // LOADING STATE
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: CircularProgressIndicator(
                                  color: Color(0xFF9DAE7A)),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildNavBar(context),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, bool isActive, VoidCallback onTap) {
    const activeColor = Color(0xFFC87A3A);
    const inkSoft = Color(0xFF9E7A50);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFE39A5C).withValues(alpha: 0.14)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, size: 22, color: isActive ? activeColor : inkSoft),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottom = bottomInset > 0 ? bottomInset : 22.0;
    return Positioned(
      left: 16,
      right: 16,
      bottom: bottom,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: 66,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.82),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: const Color(0xFFE8D5BC).withValues(alpha: 0.5),
                  width: 1),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF2C1E0C).withValues(alpha: 0.08),
                    blurRadius: 30,
                    offset: const Offset(0, 8)),
                BoxShadow(
                    color: const Color(0xFF2C1E0C).withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(Icons.home_outlined, false,
                      () => Navigator.pushReplacementNamed(context, '/home')),
                  _navItem(Icons.calendar_month_outlined, true, () {}),
                  _navItem(
                      Icons.bar_chart,
                      false,
                      () => Navigator.pushReplacementNamed(
                          context, '/statistic')),
                  _navItem(
                      Icons.settings_outlined,
                      false,
                      () =>
                          Navigator.pushReplacementNamed(context, '/settings')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
