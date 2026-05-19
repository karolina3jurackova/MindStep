import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_running_focus.dart';
import 'package:adv_basics/models/task_args.dart';
import 'package:adv_basics/models/task_progress_model.dart';
import 'package:adv_basics/data/task_registry.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:adv_basics/services/notification_service.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunicationDetailScreen extends StatefulWidget {
  final TaskArgs args;
  const CommunicationDetailScreen({super.key, required this.args});

  @override
  State<CommunicationDetailScreen> createState() =>
      _CommunicationDetailScreenState();
}

class _CommunicationDetailScreenState
    extends State<CommunicationDetailScreen> {
  TaskProgressModel? _progress;
  bool _loading = true;
  bool _marking = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final p =
        await FirestoreService().getTaskProgress(widget.args.taskId);
    if (mounted) {
      setState(() {
        _progress = p;
        _loading = false;
      });
    }
  }

  Future<void> _markActiveForToday() async {
    setState(() => _marking = true);
    await FirestoreService().markTaskActiveForToday(widget.args.taskId);
    await NotificationService.instance.scheduleCommNotificationsForToday();
    final p =
        await FirestoreService().getTaskProgress(widget.args.taskId);
    if (mounted) {
      setState(() {
        _progress = p;
        _marking = false;
      });
    }
  }

  void _goToReflection() {
    Navigator.pushNamed(
      context,
      '/thoughts',
      arguments: widget.args,
    );
  }

  void _showTipsSheet(List<String> tips) {
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

  @override
  Widget build(BuildContext context) {
    final task = getTaskById(widget.args.taskId);
    final dayContent = task?.getDayContent(widget.args.currentDay);
    final focus = dayContent?.fact1 ?? '';
    final insight = dayContent?.fact2 ?? '';
    final hasTips = task?.tips.isNotEmpty == true;

    final today = FirestoreService.dateKey(DateTime.now());
    final markedToday = _progress?.markedActiveDate == today;
    final completedToday = _progress?.lastCompletedDate == today;

    return Scaffold(
      backgroundColor: const Color(0xFFE5AB6E),
      body: CustomPaint(
        painter: ShapeRunningFocus(),
        child: SizedBox.expand(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 4),
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, '/communication'),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color:
                            const Color(0xFFFFF3DC).withValues(alpha: 0.7),
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
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
                            Row(
                              children: [
                                Image.asset('assets/images/fire.png',
                                    width: 18, height: 18),
                                const SizedBox(width: 4),
                                Text(
                                  'Den ${widget.args.currentDay} z ${widget.args.totalDays}',
                                  style: GoogleFonts.josefinSans(
                                    color: const Color(0xFF40260A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        if (focus.isNotEmpty) ...[
                          _focusCard(focus),
                          const SizedBox(height: 12),
                        ],

                        if (insight.isNotEmpty) ...[
                          _infoCard(title: 'Věděl jsi?', body: insight),
                          const SizedBox(height: 12),
                        ],

                        const SizedBox(height: 8),

                        if (_loading)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: CircularProgressIndicator(
                                  color: Color(0xFF7A5230)),
                            ),
                          )
                        else if (completedToday)
                          _completedTodayWidget()
                        else if (markedToday)
                          _markedActiveWidget()
                        else
                          _tryTodayButton(),

                        const SizedBox(height: 16),

                        if (hasTips && markedToday)
                          GestureDetector(
                            onTap: () => _showTipsSheet(task!.tips),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7A5230),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.black.withValues(alpha: 0.12),
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

  Widget _focusCard(String focus) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC).withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            color: const Color(0xFF9DAE7A).withValues(alpha: 0.55),
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color:
                const Color.fromARGB(255, 66, 63, 63).withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wb_sunny_outlined,
                  color: Color(0xFF9DAE7A), size: 18),
              const SizedBox(width: 6),
              Text(
                'Dnešní focus',
                style: GoogleFonts.josefinSans(
                  color: const Color(0xFF9DAE7A),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            focus,
            style: GoogleFonts.judson(
              color: const Color(0xFF40260A),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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

  Widget _tryTodayButton() {
    return GestureDetector(
      onTap: _marking ? null : _markActiveForToday,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF9DAE7A),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: _marking
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2.5),
                )
              : Text(
                  'Zkusím to dnes',
                  style: GoogleFonts.judson(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      ),
    );
  }

  bool get _isReflectionAvailable => DateTime.now().hour >= 18;

  Widget _markedActiveWidget() {
    final canReflect = _isReflectionAvailable;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3DC).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Color(0xFF9DAE7A), size: 20),
              const SizedBox(width: 10),
              Text(
                'Záměr na dnes je nastaven',
                style: GoogleFonts.judson(
                  color: const Color(0xFF40260A),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (canReflect)
          GestureDetector(
            onTap: _goToReflection,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF7A5230),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Reflektovat večer',
                  style: GoogleFonts.judson(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        else
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFD3A06B).withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFFD3A06B).withValues(alpha: 0.45),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock_clock_outlined,
                        color: Color(0xFF9E7A50), size: 18),
                    const SizedBox(width: 8),
                    Text(
                      'Reflektovat večer',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF9E7A50),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Reflexe bude dostupná po 18:00.',
                  style: GoogleFonts.josefinSans(
                    color: const Color(0xFF9E7A50),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _completedTodayWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DC).withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Icon(Icons.sentiment_very_satisfied_outlined,
              color: Color(0xFF9DAE7A), size: 34),
          const SizedBox(height: 8),
          Text(
            'Skvělá práce dnes!',
            style: GoogleFonts.judson(
              color: const Color(0xFF40260A),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.args.currentDay < widget.args.totalDays
                ? 'Vrať se zítra na den ${widget.args.currentDay + 1}.'
                : 'Dokončil/a jsi všech ${widget.args.totalDays} dní. Úžasné!',
            textAlign: TextAlign.center,
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
