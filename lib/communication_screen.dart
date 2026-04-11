import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_tasks.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({super.key});

  @override
  State<CommunicationScreen> createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen> {
  bool _isHabit = false;

  Widget _taskCard(BuildContext context, bool hasProgress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 251, 237, 214),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 17, right: 12, top: 12, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to learn a New skill',
              style: GoogleFonts.judson(
                color: const Color(0xFF40260A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ĽAVÁ STRANA
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: GestureDetector(
                          onTap: () {
                            // TODO: spustiť úlohu
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF9DAE7A),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'START',
                              style: GoogleFonts.josefinSans(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Color(0xFF6E3E09),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '10 min',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF6E3E09),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: Color(0xFF6E3E09),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '10 days',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF6E3E09),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                // PRAVÁ STRANA
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bla bla bla bla bla bla bla blablablablablabal',
                          style: GoogleFonts.judson(
                            color: const Color(0xFF6E3E09),
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        if (hasProgress) ...[
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/fire.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Day 4 of 10',
                                style: GoogleFonts.josefinSans(
                                  color: const Color(0xFF6E3E09),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const LinearProgressIndicator(
                              value: 4 / 10,
                              backgroundColor: Color(0xFFE3D5C0),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF9DAE7A),
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 228, 195),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD3A06B).withValues(alpha: 0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              border: Border(
                top: BorderSide(
                  color: const Color.fromARGB(255, 241, 220, 184)
                      .withValues(alpha: 0.35),
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000).withValues(alpha: 0.10),
                  blurRadius: 25,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                      );
                    },
                    child: const Icon(
                      Icons.home_outlined,
                      color: Color(0xFF6E3E09),
                      size: 28,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/statistic',
                      );
                    },
                    child: const Icon(
                      Icons.bar_chart,
                      color: Color(0xFF6E3E09),
                      size: 28,
                    ),
                  ),

                  // PLUS BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/add_new_focus',
                      );
                    },
                    child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: Container(
                        width: 68,
                        height: 68,
                        decoration: const BoxDecoration(
                          color: Color(0xFF9DAE7A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 38,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/calendar',
                      );
                    },
                    child: const Icon(
                      Icons.calendar_month_outlined,
                      color: Color(0xFF6E3E09),
                      size: 28,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/settings',
                      );
                    },
                    child: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF6E3E09),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // BLOB 2
          Positioned(
            top: 0,
            right: 0,
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: ClipPath(
                    clipper: TopLeftBlob(),
                    child: Container(
                      width: size.width * 0.99,
                      height: size.height * 0.8,
                      color: const Color(0xFFF6D7AF).withValues(alpha: 0.70),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: RightSoftBlob(),
                  child: Container(
                    width: size.width * 0.99,
                    height: size.height * 0.8,
                    color: const Color.fromARGB(255, 237, 198, 160)
                        .withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),

          // BLOB 1 — vľavo hore, tmavší
          Positioned(
            left: 0,
            top: 0,
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: ClipPath(
                    clipper: TopLeftBlob(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.60,
                      color: const Color.fromARGB(255, 209, 153, 98)
                          .withValues(alpha: 0.60),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: TopLeftBlob(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.60,
                    color: const Color.fromARGB(255, 218, 170, 121)
                        .withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            bottom: 0,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: ClipPath(
                clipper: BottomRightBlob(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.72,
                  color: const Color.fromARGB(110, 223, 171, 122)
                      .withValues(alpha: 0.40),
                ),
              ),
            ),
          ),

          // OBSAH
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 8),

                Text(
                  'Choose focus',
                  style: GoogleFonts.judson(
                    color: const Color(0xFF6E3E09),
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),

                // PREPÍNAČ
                Container(
                  width: 345,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF3E2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_isHabit) {
                              setState(() => _isHabit = false);
                              Navigator.pushReplacementNamed(
                                context,
                                '/communication',
                              );
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            height: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: !_isHabit
                                  ? const Color(0xFFD3A06B)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: !_isHabit
                                  ? [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.08),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Text(
                              'Communication',
                              style: GoogleFonts.judson(
                                color: !_isHabit
                                    ? const Color(0xFFFDF3E2)
                                    : const Color(0xFF40260A),
                                fontSize: 17,
                                fontWeight: !_isHabit
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (!_isHabit) {
                              setState(() => _isHabit = true);
                              Navigator.pushReplacementNamed(
                                context,
                                '/habit',
                              );
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 220),
                            height: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: _isHabit
                                  ? const Color(0xFFD3A06B)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: _isHabit
                                  ? [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.08),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Text(
                              'Habit',
                              style: GoogleFonts.judson(
                                color: _isHabit
                                    ? const Color(0xFFFDF3E2)
                                    : const Color(0xFF40260A),
                                fontSize: 17,
                                fontWeight: _isHabit
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Today's focus",
                  style: GoogleFonts.judson(
                    color: const Color.fromARGB(255, 77, 46, 13),
                    fontSize: 43,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Choose one small communication skill',
                  style: GoogleFonts.judson(
                    color: const Color(0xFF6E3E09),
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _taskCard(context, index == 0);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
