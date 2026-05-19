import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_home.dart';
import 'package:adv_basics/models/user_model.dart';
import 'package:adv_basics/models/daily_entry_model.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStreak = 0;
  String _avatarAsset = 'avatar1.png';
  StreamSubscription<UserModel>? _userSub;
  List<DailyEntryModel> _allEntries = [];

  @override
  void initState() {
    super.initState();

    _userSub = FirestoreService().streamUserData().listen((user) {
      if (mounted) {
        setState(() {
          _currentStreak = user.currentStreak;
          _avatarAsset = user.avatarAsset;
        });
      }
    });

    _loadEntries();
    // Warm the task progress cache in the background so habit/communication
    // screens open instantly when the user navigates there.
    FirestoreService().getAllTaskProgress();
  }

  Future<void> _loadEntries() async {
    final entries = await FirestoreService().getAllEntries();
    if (mounted) {
      setState(() => _allEntries = entries);
    }
  }

  @override
  void dispose() {
    _userSub?.cancel();
    super.dispose();
  }

  String get _todayKey {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  DailyEntryModel? get _todayEntry {
    for (final entry in _allEntries) {
      if (entry.dateKey == _todayKey) return entry;
    }
    return null;
  }

  DailyEntryModel? get _latestEntry {
    if (_allEntries.isEmpty) return null;
    return _allEntries.last;
  }

  ({String taskName, String category, bool isToday}) get _cardTask {
    final today = _todayEntry;
    final latest = _latestEntry;

    if (latest == null) {
      return (taskName: '', category: 'habit', isToday: false);
    }

    if (today != null) {
      return (
        taskName: today.taskName,
        category: today.category,
        isToday: true
      );
    }

    return (
      taskName: latest.taskName,
      category: latest.category,
      isToday: false
    );
  }

  String _getWeekdayName(int weekday) {
    const days = ['Po', 'Út', 'St', 'Čt', 'Pá', 'So', 'Ne'];
    return days[weekday - 1];
  }

  Widget _dayItem(String day, String date, bool isActive) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.judson(
            color: const Color(0xFF6E3E09),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF9DAE7A) : const Color(0xFFFDF3E2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              date,
              style: GoogleFonts.judson(
                color: isActive
                    ? const Color(0xFFFDF3E2)
                    : const Color(0xFF40260A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(
    BuildContext context,
    String image,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFDF3E2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/$image.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.judson(
                          color: const Color(0xFF40260A),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: GoogleFonts.judson(
                          color: const Color(0xFF6E3E09),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF6E3E09),
                  size: 24,
                ),
              ],
            ),
          ),
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
        child: Icon(
          icon,
          size: 22,
          color: isActive ? activeColor : inkSoft,
        ),
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
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: const Color(0xFF2C1E0C).withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(Icons.home_outlined, true, () {}),
                  _navItem(
                    Icons.calendar_month_outlined,
                    false,
                    () => Navigator.pushReplacementNamed(context, '/calendar'),
                  ),
                  _navItem(
                    Icons.bar_chart,
                    false,
                    () => Navigator.pushReplacementNamed(context, '/statistic'),
                  ),
                  _navItem(
                    Icons.settings_outlined,
                    false,
                    () => Navigator.pushReplacementNamed(context, '/settings'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getDragonImage() {
    if (_currentStreak >= 15) return 'assets/images/adult_dragon2.png';
    if (_currentStreak >= 10) return 'assets/images/baby_dragon.png';
    if (_currentStreak >= 5) return 'assets/images/cracked_egg.png';
    return 'assets/images/egg.png';
  }

  Widget _dragonWidget() {
    final image = _getDragonImage();

    final isBabyDragon = image.contains('baby_dragon');
    final isAdultDragon = image.contains('adult_dragon2');

    if (isAdultDragon) {
      return SizedBox(
        width: 150,
        height: 150,
        child: Transform.scale(
          scale: 1.2,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    if (isBabyDragon) {
      return SizedBox(
        width: 135,
        height: 135,
        child: Transform.scale(
          scale: 2.1,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      );
    }

    return SizedBox(
      width: 135,
      height: 135,
      child: Transform.scale(
        scale: 1.3,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildFocusCard(BuildContext context) {
    if (_latestEntry == null) {
      return Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: const Color(0xFFFDF3E2),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Připraven začít? 🌱',
                      style: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 85, 45, 3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Vyber svůj první návyk a začni svou cestu.',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF6E3E09),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/habit'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9DAE7A),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Začít teď',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFFFDF3E2),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.chevron_right,
                              color: Color(0xFFFDF3E2),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              _dragonWidget(),
            ],
          ),
        ),
      );
    }

    final card = _cardTask;
    final route = card.category == 'habit' ? '/habit' : '/communication';
    final heading = card.isToday ? 'Splněno dnes ✅' : 'Pokračuj!';
    final badge = card.category == 'habit' ? 'Návyk' : 'Komunikace';
    final badgeColor = card.category == 'habit'
        ? const Color(0xFF9DAE7A)
        : const Color(0xFFD3A06B);

    return Container(
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: const Color(0xFFFDF3E2),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Text(
                        heading,
                        style: GoogleFonts.judson(
                          color: const Color.fromARGB(255, 85, 45, 3),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.josefinSans(
                            color: badgeColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card.taskName,
                    style: GoogleFonts.judson(
                      color: const Color(0xFF6E3E09),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, route),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9DAE7A),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            card.isToday ? 'Zobrazit úkoly' : 'Pokračovat',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFFFDF3E2),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFFDF3E2),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 130,
              child: Align(
                alignment: Alignment.centerRight,
                child: _dragonWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 11) return 'Dobré ráno';
    if (hour >= 11 && hour < 18) return 'Dobré odpoledne';
    return 'Dobrý večer';
  }

  String _getFormattedDate() {
    final now = DateTime.now();

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

    return '${weekdays[now.weekday - 1]}, ${now.day}. ${months[now.month - 1]} ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final greeting = _getGreeting();
    final formattedDate = _getFormattedDate();

    final days = List.generate(5, (index) {
      final date = today.add(Duration(days: index - 2));
      final isToday = date.day == today.day &&
          date.month == today.month &&
          date.year == today.year;

      return _dayItem(
        _getWeekdayName(date.weekday),
        date.day.toString(),
        isToday,
      );
    });

    final streakLabel =
        _currentStreak == 1 ? '1 den Streak' : '$_currentStreak dní Streak';

    return Scaffold(
      extendBody: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.biggest;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFBEED7),
                  Color(0xFFEFBA84),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: ClipPath(
                      clipper: BottomWaveClipper(),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.58,
                        color: const Color.fromARGB(126, 223, 171, 122),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: SafeArea(
                    bottom: false,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 110),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        greeting,
                                        style: GoogleFonts.judson(
                                          color: const Color.fromARGB(
                                            255,
                                            104,
                                            55,
                                            4,
                                          ),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: GoogleFonts.judson(
                                          color: const Color(0xFF6E3E09),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFECB47C)
                                              .withValues(alpha: 0.32),
                                          border: Border.all(
                                            color: const Color(0xFFFE9848),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/fire.png',
                                              width: 25,
                                              height: 20,
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              streakLabel,
                                              style: GoogleFonts.josefinSans(
                                                color: const Color(0xFF6E3E09),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/settings',
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(36),
                                    child: Image.asset(
                                      'assets/images/$_avatarAsset',
                                      width: 72,
                                      height: 72,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: days,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            child: _buildFocusCard(context),
                          ),
                          const SizedBox(height: 25),
                          _categoryCard(
                            context,
                            'communication',
                            'Komunikace',
                            'Buduj lepší vztahy',
                            () => Navigator.pushReplacementNamed(
                              context,
                              '/communication',
                            ),
                          ),
                          _categoryCard(
                            context,
                            'habit',
                            'Návyky',
                            'Buduj svou rutinu',
                            () => Navigator.pushReplacementNamed(
                              context,
                              '/habit',
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildNavBar(context),
              ],
            ),
          );
        },
      ),
    );
  }
}
