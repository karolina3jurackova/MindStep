import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_home.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

  Widget _categoryCard(BuildContext context, String image, String title,
      String subtitle, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: GestureDetector(
        onTap: onTap, // ← klikateľná karta
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
                // OBRÁZOK
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
                // TEXT
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
                // ŠÍPKA
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDF3E2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // HOME — aktívny
              GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9DAE7A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.home_outlined,
                          color: Color(0xFFFDF3E2), size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'Home',
                        style: GoogleFonts.josefinSans(
                          color: const Color(0xFFFDF3E2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // PROGRESS
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

              // KALENDÁR
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

              // NASTAVENIA
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
                // Spodná vlna
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Stack(
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3,
                        ),
                        child: ClipPath(
                          clipper: BottomWaveClipper(),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.58,
                            color: const Color.fromARGB(126, 223, 171, 122),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Obsah obrazovky
                Positioned.fill(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // HEADER
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ĽAVÁ STRANA
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Good morning',
                                      style: GoogleFonts.judson(
                                        color: const Color.fromARGB(
                                            255, 104, 55, 4),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Wednesday, 18 March, 2026',
                                      style: GoogleFonts.judson(
                                        color: const Color(0xFF6E3E09),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),

                                    // STREAK BADGE
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFECB47C)
                                            .withValues(alpha: 0.32),
                                        border: Border.all(
                                          color: const Color(0xFFFE9848),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/fire.png',
                                            width: 25,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            '2 days Streak',
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

                                // AVATAR — klikateľný, navigácia na profil
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/settings',
                                    );
                                  },
                                  child: const CircleAvatar(
                                    radius: 36,
                                    backgroundColor: Color(0xFF9DAE7A),
                                    child:
                                        Icon(Icons.person, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // KALENDÁR -> kalendár bude zobrazovať aktuálne dni, vždy ich bude 5 a ten aktuálny bude zvýraznený
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _dayItem('Mon', '16', false),
                                _dayItem('Tue', '17', false),
                                _dayItem('Wed', '18', true),
                                _dayItem('Thu', '19', false),
                                _dayItem('Fri', '20', false),
                              ],
                            ),
                          ),

                          // KEEP GOING KARTA
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // ĽAVÁ STRANA
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Keep going!',
                                            style: GoogleFonts.judson(
                                              color: const Color.fromARGB(
                                                  255, 85, 45, 3),
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 1),
                                          Text(
                                            'How to learn a New skill', // Tu sa bude dávať názov podľa toho aký uživateľ má rozrobený kurz
                                            style: GoogleFonts.judson(
                                              color: const Color(0xFF6E3E09),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 16),

                                          // CONTINUE BUTTON -> PREPOJIŤ na DETAIL KURZU priamo toho čo je rozrobený
                                          ElevatedButton.icon(
                                            onPressed: () {
                                              // TODO: navigácia na detail kurzu
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF9DAE7A),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 7,
                                              ),
                                              elevation: 0,
                                            ),
                                            icon: const SizedBox.shrink(),
                                            label: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Continue',
                                                  style:
                                                      GoogleFonts.josefinSans(
                                                    color:
                                                        const Color(0xFFFDF3E2),
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

                                          const SizedBox(height: 20),

                                          // DAY INFO
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/fire.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                'Day 4 of 10', // TREBA TO SPRAVIŤ REAL, KOLKO DNÍ Z KOLKYCH JE HOTOVO
                                                style: GoogleFonts.josefinSans(
                                                  color:
                                                      const Color(0xFF6E3E09),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: 8),

                                          // PROGRESS BAR
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: LinearProgressIndicator(
                                              value: 4 / 10,
                                              backgroundColor:
                                                  const Color(0xFFE3D5C0),
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                      Color>(Color(0xFF9DAE7A)),
                                              minHeight: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    // DRAK -> BUDE SA MENIŤ PODĽA PROGRESU (podla streak)
                                    Image.asset(
                                      'assets/images/adult_dragon2.png',
                                      width: 140,
                                      height: 180,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // CATEGORY KARTY
                          const SizedBox(height: 25),

                          _categoryCard(
                            context,
                            'communication',
                            'Communication',
                            'Build better relationships',
                            () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/communication',
                              );
                            },
                          ),
                          _categoryCard(
                            context,
                            'habit',
                            'Habits',
                            'Build your routine',
                            () {
                              Navigator.pushReplacementNamed(
                                context,
                                '/habit',
                              );
                            },
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
