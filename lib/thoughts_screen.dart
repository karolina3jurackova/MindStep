import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_thoughts.dart';
import 'package:google_fonts/google_fonts.dart';

class ThoughtsScreen extends StatefulWidget {
  const ThoughtsScreen({super.key});

  @override
  State<ThoughtsScreen> createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  int? _selectedMood;
  final _notesController = TextEditingController();

  final List<String> _moodAssets = [
    'assets/images/sad.png',
    'assets/images/neutral.png',
    'assets/images/smile.png',
    'assets/images/excited.png',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool canDone = _selectedMood != null;

    return Scaffold(
      body: CustomPaint(
        painter: ShapeRunningFocus(),
        child: SizedBox.expand(
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // MASKOT
                  Image.asset(
                    'assets/images/reading.PNG',
                    width: 160,
                    height: 160,
                    errorBuilder: (_, __, ___) => const SizedBox(height: 160),
                  ),

                  const SizedBox(height: 3),

                  // NICE WORK
                  Text(
                    'Nice work!',
                    style: GoogleFonts.judson(
                      color: const Color(0xFF40260A),
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // HOW DID YOU FEEL
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36)
                              .withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'How did you feel?',
                          style: GoogleFonts.judson(
                            color: const Color(0xFF6E3E09),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36)
                              .withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // OHNÍKY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(_moodAssets.length, (index) {
                      final isSelected = _selectedMood == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() => _selectedMood = index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? const Color(0xFF7A5230)
                                    .withValues(alpha: 0.15)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF7A5230)
                                      .withValues(alpha: 0.5)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: AnimatedScale(
                            scale: isSelected ? 1.15 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Image.asset(
                              _moodAssets[index],
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // DAY X OF Y
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36)
                              .withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Day 5 of 10',
                          style: GoogleFonts.judson(
                            color: const Color(0xFF6E3E09),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36)
                              .withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 42),

                  // ANYTHING YOU'D LIKE TO NOTE
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Anything you'd like to note?",
                      style: GoogleFonts.judson(
                        color: const Color(0xFF40260A),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // TEXT POLE
                  TextField(
                    controller: _notesController,
                    minLines: 1, // začína tenký
                    maxLines: null, // rozširuje sa podľa obsahu
                    textAlign: TextAlign.left, // hint text v strede
                    style: GoogleFonts.judson(
                      color: const Color(0xFF40260A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Write your thoughts...',
                      hintStyle: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 107, 81, 51),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color(0xFFD3A06B), width: 1.2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color(0xFFD3A06B), width: 1.8),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFFF3DC).withValues(alpha: 0.6),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                    ),
                  ),

                  const SizedBox(height: 49),

                  // DONE TLAČIDLO
                  GestureDetector(
                    onTap: canDone
                        ? () {
                            // TODO: uložiť údaje
                          }
                        : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: canDone
                            ? const Color.fromARGB(255, 169, 187, 133)
                            : const Color.fromARGB(255, 157, 174, 116),

                        borderRadius: BorderRadius.circular(30),

                        // 👇 TIEŇ
                        boxShadow: canDone
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 15,
                                  offset: const Offset(0, 6),
                                ),
                              ]
                            : [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                      ),
                      child: Text(
                        'DONE',
                        style: GoogleFonts.judson(
                          color: canDone
                              ? Colors.white
                              : Colors.white.withValues(alpha: 1),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
