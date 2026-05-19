import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/models/daily_entry_model.dart';
import 'package:adv_basics/models/user_model.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/Shapes/shape_statistic.dart';

enum _Period { week, month, year }

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  _Period _period = _Period.month;
  UserModel _user = UserModel.empty();
  List<DailyEntryModel> _entries = [];
  int _cancelledCount = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final service = FirestoreService();
    final user = await service.streamUserData().first;
    final entries = await service.getAllEntries();
    final cancelledCount = await service.getCancelledTaskCount();
    if (mounted) {
      setState(() {
        _user = user;
        _entries = entries;
        _cancelledCount = cancelledCount;
        _loading = false;
      });
    }
  }

  DateTime get _periodStart {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    switch (_period) {
      case _Period.week:
        return today.subtract(Duration(days: today.weekday - 1));
      case _Period.month:
        return DateTime(now.year, now.month, 1);
      case _Period.year:
        return DateTime(now.year, 1, 1);
    }
  }

  List<DailyEntryModel> get _periodEntries {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = _periodStart;
    return _entries.where((e) {
      final d = DateTime.parse(e.dateKey);
      return !d.isBefore(start) && !d.isAfter(today);
    }).toList();
  }

  int get _distinctActiveDays =>
      _periodEntries.map((e) => e.dateKey).toSet().length;

  int get _skippedDays {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final totalDays = today.difference(_periodStart).inDays + 1;
    return (totalDays - _distinctActiveDays).clamp(0, totalDays);
  }

  String _formatTime(int minutes) {
    if (minutes < 60) return '$minutes min';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m > 0 ? '${h}h ${m}m' : '${h}h';
  }

  // ── build ─────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 232, 205),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ShapeStatistic(),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: _loading
                  ? const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF9DAE7A)))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TITLE
                          Text(
                            'Statistiky',
                            style: GoogleFonts.judson(
                              color: const Color(0xFF40260A),
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tvůj pokrok na jednom místě',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF9E7A50),
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 22),

                          // PERIOD TOGGLE
                          _periodToggle(),
                          const SizedBox(height: 16),

                          // STATS 2×2 GRID
                          _statsGrid(),
                          const SizedBox(height: 16),

                          // STREAKS SECTION
                          _streaksSection(),
                        ],
                      ),
                    ),
            ),
          ),
          _buildNavBar(context),
        ],
      ),
    );
  }

  // ── widgets ───────────────────────────────────────────────────

  Widget _periodToggle() {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        children: _Period.values.map((p) {
          final isActive = _period == p;
          final labels = {
            _Period.week: 'Týden',
            _Period.month: 'Měsíc',
            _Period.year: 'Rok'
          };
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _period = p),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      isActive ? const Color(0xFFD3A06B) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 8,
                              offset: const Offset(0, 3))
                        ]
                      : null,
                ),
                child: Text(
                  labels[p]!,
                  style: GoogleFonts.judson(
                    color: isActive
                        ? const Color(0xFFFDF3E2)
                        : const Color(0xFF40260A),
                    fontSize: 17,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _statsGrid() {
    final pe = _periodEntries;
    final periodFocused = pe.fold(0, (s, e) => s + e.durationMinutes);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _statCard(
                icon: Icons.check_circle_outline_rounded,
                iconColor: const Color(0xFF9DAE7A),
                label: 'SPLNĚNÉ DNY',
                value: '$_distinctActiveDays',
                unit: 'celkem',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _statCard(
                icon: Icons.fast_forward_rounded,
                iconColor: const Color(0xFFD3A06B),
                label: 'PŘESKOČENO',
                value: '$_skippedDays',
                unit: 'dní',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _statCard(
                icon: Icons.timer_outlined,
                iconColor: const Color(0xFF8BACC8),
                label: 'SOUSTŘEDĚNÍ',
                value: periodFocused == 0 ? '0' : _formatTime(periodFocused),
                unit: 'celkem',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _statCard(
                icon: Icons.cancel_outlined,
                iconColor: const Color(0xFFE07B7B),
                label: 'VZDÁNO',
                value: '$_cancelledCount',
                unit: _cancelledCount == 1 ? 'úkol' : 'úkolů',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.josefinSans(
              color: const Color(0xFF9E7A50),
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: GoogleFonts.judson(
              color: const Color(0xFF40260A),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            unit,
            style: GoogleFonts.judson(
              color: const Color(0xFF6E3E09),
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _streaksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            'Streak',
            style: GoogleFonts.judson(
              color: const Color(0xFF40260A),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          decoration: BoxDecoration(
            color: const Color(0xFFFAEDD8),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 3)),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Sets Stack height: leaf area + pill overlap space
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [SizedBox(height: 195)],
              ),
              // Leaf at top, bottom edge will be overlapped by pill
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 175,
                child: Image.asset(
                  'assets/images/leaf.png',
                  fit: BoxFit.contain,
                ),
              ),
              // Current streak text centered on leaf
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 155,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${_user.currentStreak} dní',
                        style: GoogleFonts.judson(
                          color: const Color(0xFF40260A),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Aktuální Streak',
                        style: GoogleFonts.judson(
                          color: const Color.fromARGB(255, 113, 137, 90),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Pill at bottom, rendered on top, gently overlapping leaf's lower edge
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 11),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF3E2),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withValues(alpha: 0.07),
                            blurRadius: 8,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Text(
                      'Nejdelší Streak: ${_user.longestStreak} dní',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF40260A),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
                width: 1,
              ),
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
                  _navItem(
                      Icons.calendar_month_outlined,
                      false,
                      () =>
                          Navigator.pushReplacementNamed(context, '/calendar')),
                  _navItem(Icons.bar_chart, true, () {}),
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
