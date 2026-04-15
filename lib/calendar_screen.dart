import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentMonth = DateTime(2026, 3);
  int? _selectedDay = 18;

  // TODO: nahradiť reálnymi dátami
  final Set<int> _activeDays = {3, 8, 10, 14, 15, 17, 18, 20, 22, 24};

  // TODO: nahradiť reálnymi dátami
  final Map<int, String> _moodMap = {
    18: 'happy',
  };

  // TODO: nahradiť reálnymi dátami
  final int _happyCount = 12;
  final int _neutralCount = 4;
  final int _goodCount = 1;
  final int _mehCount = 3;
  final int _activeDaysCount = 12;

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _selectedDay = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _selectedDay = null;
    });
  }

  String get _monthLabel {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
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
    while (days.length % 7 != 0) days.add(null);
    return days;
  }

  @override
  Widget build(BuildContext context) {
    final calendarDays = _buildCalendarDays();
    final selectedHasMood =
        _selectedDay != null && _moodMap.containsKey(_selectedDay);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 232, 205),
      body: CustomPaint(
        painter: ShapeCalendarPainter(),
        child: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: SizedBox.expand(
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
                              offset: const Offset(0, 3),
                            ),
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
                                fontWeight: FontWeight.bold,
                              ),
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // DNI V TÝŽDNI
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                                'Sat',
                                'Sun'
                              ]
                                  .map((d) => SizedBox(
                                        width: 36,
                                        child: Text(
                                          d,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.josefinSans(
                                            color: const Color(0xFF9E7A50),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 5),

                            // DNI
                            ...List.generate(calendarDays.length ~/ 7, (row) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: List.generate(7, (col) {
                                    final day = calendarDays[row * 7 + col];
                                    if (day == null) {
                                      return const SizedBox(
                                          width: 36, height: 36);
                                    }
                                    final dayNum = day.day;
                                    final isSelected = _selectedDay == dayNum;
                                    final isActive =
                                        _activeDays.contains(dayNum);
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
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isSelected
                                                  ? const Color(0xFFD3A06B)
                                                  : Colors.transparent,
                                              border: isToday
                                                  ? Border.all(
                                                      color: const Color(
                                                          0xFFD3A06B),
                                                      width: 1.5)
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                '$dayNum',
                                                style: GoogleFonts.josefinSans(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : const Color(0xFF40260A),
                                                  fontSize: 16,
                                                  fontWeight: isSelected
                                                      ? FontWeight.w700
                                                      : FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 1),
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isActive
                                                  ? const Color(0xFF9DAE7A)
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _moodStat('$_happyCount Happy'),
                            _moodStat('$_neutralCount Neutral'),
                            _moodStat('$_goodCount Good'),
                            _moodStat('$_mehCount Meh'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // STREAK PILULKA
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
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/fire.png',
                                width: 20, height: 20),
                            const SizedBox(width: 8),
                            Text(
                              '$_activeDaysCount ${_activeDaysCount == 1 ? 'day' : 'days'} active',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF6E3E09),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // DETAIL DŇA
                      if (_selectedDay != null &&
                          _activeDays.contains(_selectedDay!)) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3DC),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              const Divider(
                                  color: Color(0xFFE8D5B5), thickness: 1),
                              const SizedBox(height: 8),
                              if (selectedHasMood) ...[
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/${_moodMap[_selectedDay!]}.png',
                                      width: 32,
                                      height: 32,
                                      errorBuilder: (_, __, ___) => const Icon(
                                        Icons.sentiment_satisfied,
                                        color: Color(0xFFD3A06B),
                                        size: 32,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'MOOD',
                                          style: GoogleFonts.josefinSans(
                                            color: const Color(0xFF9E7A50),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        Text(
                                          _moodMap[_selectedDay!]!
                                                  .substring(0, 1)
                                                  .toUpperCase() +
                                              _moodMap[_selectedDay!]!
                                                  .substring(1),
                                          style: GoogleFonts.judson(
                                            color: const Color(0xFF40260A),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'I felt more confident today',
                                  style: GoogleFonts.judson(
                                    color:
                                        const Color.fromARGB(255, 116, 90, 59),
                                    fontSize: 17,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Divider(
                                    color: Color(0xFFE8D5B5), thickness: 1),
                                const SizedBox(height: 12),
                              ],
                              Row(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF9DAE7A),
                                    ),
                                    child: const Icon(Icons.check,
                                        color: Colors.white, size: 16),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Habit completed',
                                        style: GoogleFonts.judson(
                                          color: const Color(0xFF40260A),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'How to learn New Skill',
                                        style: GoogleFonts.judson(
                                          color: const Color.fromARGB(
                                              255, 107, 136, 78),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildNavBar(context),
            ),
          ],
        ),
      ),
    );
  }

  String _formatSelectedDate() {
    if (_selectedDay == null) return '';
    final date =
        DateTime(_currentMonth.year, _currentMonth.month, _selectedDay!);
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${weekdays[date.weekday - 1]}, $_selectedDay ${months[date.month - 1]}, ${date.year}';
  }

  Widget _moodStat(String label) {
    return Text(
      label,
      style: GoogleFonts.josefinSans(
        color: const Color(0xFF6E3E09),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    const navColor = Color(0xFFFBEED7);
    const pillColor = Color(0xFFB9B880);
    const iconColor = Color(0xFF8C6239);

    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.fromLTRB(24, 14, 24, bottomInset > 0 ? bottomInset : 18),
      decoration: BoxDecoration(
        color: navColor.withValues(alpha: 0.81),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            child: const Icon(
              Icons.home_outlined,
              color: iconColor,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/statistic'),
            child: const Icon(
              Icons.bar_chart,
              color: iconColor,
              size: 28,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: pillColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: navColor.withValues(alpha: 0.81),
                    size: 22,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Calendar',
                    style: GoogleFonts.josefinSans(
                      color: navColor.withValues(alpha: 0.81),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
            child: const Icon(
              Icons.settings_outlined,
              color: iconColor,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
