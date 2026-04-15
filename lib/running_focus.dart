import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_running_focus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class RunningFocus extends StatefulWidget {
  const RunningFocus({super.key});

  @override
  State<RunningFocus> createState() => _RunningFocusState();
}

class _RunningFocusState extends State<RunningFocus> {
  final int _totalSeconds = 10 * 60;
  late int _remainingSeconds;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _totalSeconds;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      if (_remainingSeconds == 0) {
        setState(() => _remainingSeconds = _totalSeconds);
      }
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds == 0) {
          timer.cancel();
          setState(() => _isRunning = false);
        } else {
          setState(() => _remainingSeconds--);
        }
      });
      setState(() => _isRunning = true);
    }
  }

  void _showMoreTips() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 36, 20, 32),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF3DC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // HANDLE
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3A06B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // NADPIS
                    Text(
                      'More Tips',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF40260A),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // TIP KARTIČKY
                    _tipSheetCard('blabla bla bla blablabla bla bla blabla'),
                    const SizedBox(height: 10),
                    _tipSheetCard(
                      'blabla bla bla blablabla bla bla blabla bla bla bla',
                    ),
                    const SizedBox(height: 10),
                    _tipSheetCard(
                      'blabla bla bla blablabla bla bla blablablab bla bla bla bla bla bla',
                    ),

                    const SizedBox(height: 2),
                  ],
                ),
              ),

              // DRAK NAD LIŠTOU
              Positioned(
                top: -110,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/head.png',
                    width: 140,
                    height: 140,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _tipSheetCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5E6CC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD3A06B).withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.judson(
                color: const Color(0xFF6E3E09),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get _timeDisplay {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get _progress => _remainingSeconds / _totalSeconds;

  int get _minutesLeft => (_remainingSeconds / 60).ceil();

  @override
  Widget build(BuildContext context) {
    // vnútorný kruh = 220, progress oblúk = 260 (medzera 20px na každej strane)
    const double innerSize = 220;
    const double outerSize = 268;
    const double totalHeight = outerSize + 40; // miesto pre tlačidlo

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: ShapeRunningFocus()),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // NADPIS + DAY
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'How to learn a\nNew skill', // TOTO sa bude meniť podľa zvoleného focusu
                          style: GoogleFonts.judson(
                            color: const Color(0xFF40260A),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/fire.png',
                              width: 22, height: 22),
                          const SizedBox(width: 4),
                          Text(
                            'Day 4 of 10', // TOTO sa bude meniť podľa zvoleného focusu a pokroku
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF40260A),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // KRUH S ČASOVAČOM
                  Center(
                    child: SizedBox(
                      width: outerSize,
                      height: totalHeight,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // PROGRESS OBLÚK — najväčší, úplne vonku
                          SizedBox(
                            width: outerSize,
                            height: outerSize,
                            child: CustomPaint(
                              painter: _CirclePainter(progress: _progress),
                            ),
                          ),

                          // VNÚTORNÝ KRUH S TIEŇOM — menší, v strede
                          Positioned(
                            top: (outerSize - innerSize) / 2,
                            child: Container(
                              width: innerSize,
                              height: innerSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFFFF3DC),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.10),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // ČAS + MINUTES — v strede vnútorného kruhu
                          Positioned(
                            top: (outerSize - innerSize) / 2 + 60,
                            child: Column(
                              children: [
                                Text(
                                  _timeDisplay,
                                  style: GoogleFonts.judson(
                                    color: const Color(0xFF40260A),
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'MINUTES',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF6E3E09),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // PLAY/STOP TLAČIDLO — zasahuje dole do kruhu
                          Positioned(
                            bottom: 20,
                            child: GestureDetector(
                              onTap: _toggleTimer,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7A5230),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFFFF3DC),
                                    width: 4,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  _isRunning ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 1),

                  // MINUTES LEFT
                  Center(
                    child: Text(
                      '$_minutesLeft minutes left',
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFF5C3310),
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // TIP KARTIČKY
                  _tipCard(
                    title: 'Blabla BLa BLbl',
                    body:
                        'hsoidhs sdlihkldf askjdhblFKDJB kdjjdjj Ldfknsjkdfhl adsfjhakfhsad',
                  ),
                  const SizedBox(height: 12),
                  _tipCard(
                    title: 'Blabla BLa BLbl',
                    body:
                        'hsoidhs sdlihkldf askjdhblFKDJB jjhh jhhjghjhj Ldfknsjkdfhl adsfjhakfhsad',
                  ),

                  const SizedBox(height: 1),

                  // MORE TIPS TLAČIDLO S MASKOTOM
                  Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        // TLAČIDLO — s paddingom hore aby drak mal miesto
                        Padding(
                          padding: const EdgeInsets.only(top: 78),
                          child: GestureDetector(
                            onTap: _showMoreTips,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 9),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 162, 179, 127),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'MORE TIPS',
                                style: GoogleFonts.judson(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // DRAK — nad tlačidlom, prekrýva jeho hornú časť
                        Image.asset(
                          'assets/images/head.png',
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tipCard({required String title, required String body}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC).withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          // hlavný tieň (spodný)
          BoxShadow(
            color:
                const Color.fromARGB(255, 66, 63, 63).withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
          // jemný highlight hore (luxusný efekt)
          BoxShadow(
            color:
                const Color.fromARGB(255, 108, 101, 101).withValues(alpha: 0.5),
            blurRadius: 6,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.judson(
              color: const Color(0xFF40260A),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            body,
            style: GoogleFonts.judson(
              color: const Color(0xFF6E3E09),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

// PAINTER PRE KRUHOVÝ PROGRESS — beží po vonkajšom okraji
class _CirclePainter extends CustomPainter {
  final double progress;
  const _CirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // Track (celý kruh, bledší)
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color =
            const Color.fromARGB(255, 248, 221, 183).withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );

    // Progress oblúk
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159 / 2,
      2 * 3.14159 * progress,
      false,
      Paint()
        ..color =
            const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.70)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter old) => old.progress != progress;
}

//treba doplniť že keď to cele skončí tak uživateľa to prepne do how did you feel
