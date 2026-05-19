import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_running_focus.dart';
import 'package:adv_basics/models/task_args.dart';
import 'package:adv_basics/data/task_registry.dart';
import 'package:google_fonts/google_fonts.dart';

class RunningFocus extends StatefulWidget {
  final TaskArgs args;
  const RunningFocus({super.key, required this.args});

  @override
  State<RunningFocus> createState() => _RunningFocusState();
}

class _RunningFocusState extends State<RunningFocus> {
  late int _totalSeconds;
  late int _remainingSeconds;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.args.durationMinutes * 60;
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
        setState(() => _remainingSeconds--);
        if (_remainingSeconds <= 0) {
          timer.cancel();
          setState(() {
            _isRunning = false;
            _remainingSeconds = 0;
          });
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) {
              Navigator.pushReplacementNamed(
                context,
                '/thoughts',
                arguments: widget.args,
              );
            }
          });
        }
      });
      setState(() => _isRunning = true);
    }
  }

  String get _timeDisplay {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  double get _progress =>
      _totalSeconds > 0 ? _remainingSeconds / _totalSeconds : 0;
  int get _minutesLeft => (_remainingSeconds / 60).ceil();

  @override
  Widget build(BuildContext context) {
    const double innerSize = 220;
    const double outerSize = 268;
    const double totalHeight = outerSize + 40;

    final task = getTaskById(widget.args.taskId);
    final dayContent = task?.getDayContent(widget.args.currentDay);
    final fact1 = dayContent?.fact1 ?? '';
    final fact2 = dayContent?.fact2 ?? '';
    final hasTips = task?.tips.isNotEmpty == true;

    final backRoute = widget.args.category == 'habit' ? '/habit' : '/communication';

    return Scaffold(
      backgroundColor: const Color(0xFFE5AB6E),
      body: CustomPaint(
        painter: ShapeRunningFocus(),
        child: SizedBox.expand(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Šípka fixne navrchu
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 12, bottom: 4),
                  child: GestureDetector(
                    onTap: () {
                      _timer?.cancel();
                      Navigator.pushReplacementNamed(context, backRoute);
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3DC).withValues(alpha: 0.7),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF7A5230),
                        size: 18,
                      ),
                    ),
                  ),
                ),
                // Scrollovateľný obsah
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 28),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.args.taskName,
                                style: GoogleFonts.judson(
                                  color: const Color(0xFF40260A),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/fire.png',
                                        width: 18, height: 18),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${widget.args.durationMinutes} min',
                                      style: GoogleFonts.josefinSans(
                                        color: const Color(0xFF40260A),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Den ${widget.args.currentDay} z ${widget.args.totalDays}',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF7A5230),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: outerSize,
                      height: totalHeight,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          SizedBox(
                            width: outerSize,
                            height: outerSize,
                            child: CustomPaint(
                                painter: _CirclePainter(progress: _progress)),
                          ),
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
                                  'MINUT',
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
                                      color: const Color(0xFFFFF3DC), width: 4),
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
                  Center(
                    child: Text(
                      'zbývá $_minutesLeft minut',
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFF5C3310),
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (fact1.isNotEmpty) ...[
                    _infoCard(title: 'Věděl jsi?', body: fact1),
                    const SizedBox(height: 12),
                  ],
                  if (fact2.isNotEmpty) ...[
                    _infoCard(title: 'Věděl jsi?', body: fact2),
                    const SizedBox(height: 12),
                  ],
                  if (hasTips)
                    GestureDetector(
                      onTap: () => _showTipsSheet(context, task!.tips),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7A5230),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.12),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.lightbulb_outline,
                                color: Color(0xFFFFF3DC), size: 20),
                            const SizedBox(width: 8),
                            Text(
                              'Tipy pro praxi',
                              style: GoogleFonts.judson(
                                color: const Color(0xFFFFF3DC),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
);
  }

  void _showTipsSheet(BuildContext context, List<String> tips) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFFFF3DC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.55,
        minChildSize: 0.35,
        maxChildSize: 0.85,
        builder: (_, scrollController) => ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD3A06B),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'Tipy pro praxi',
              style: GoogleFonts.judson(
                color: const Color(0xFF40260A),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(Icons.lightbulb_outline,
                          size: 18, color: Color(0xFFD3A06B)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        tip,
                        style: GoogleFonts.judson(
                          color: const Color(0xFF6E3E09),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String body}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC).withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color:
                const Color.fromARGB(255, 66, 63, 63).withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 108, 101, 101)
                .withValues(alpha: 0.5),
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

class _CirclePainter extends CustomPainter {
  final double progress;
  const _CirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color =
            const Color.fromARGB(255, 248, 221, 183).withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );
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
