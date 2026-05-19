import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_tasks.dart';
import 'package:adv_basics/models/task_args.dart';
import 'package:adv_basics/models/app_task.dart';
import 'package:adv_basics/models/task_progress_model.dart';
import 'package:adv_basics/data/habit_tasks.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  bool _isHabit = true;
  Map<String, TaskProgressModel> _progress = {};
  List<AppTask> _customTasks = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final results = await Future.wait([
      FirestoreService().getAllTaskProgress(),
      FirestoreService().getCustomTasksForCategory('habit'),
    ]);
    if (mounted) {
      setState(() {
        _progress = results[0] as Map<String, TaskProgressModel>;
        _customTasks = results[1] as List<AppTask>;
        _loading = false;
      });
    }
  }

  void _onTapTask(BuildContext context, AppTask task) async {
    if (_loading) return;
    final progress = _progress[task.id] ?? TaskProgressModel.initial(task.id);
    final today = FirestoreService.dateKey(DateTime.now());

    if (progress.status == 'cancelled') {
      _showRestartConfirmSheet(context, task);
      return;
    }

    if (progress.currentDay > task.totalDays) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFFFFF3DC),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text('Úkol splněn! 🎉',
              style: GoogleFonts.judson(
                  color: const Color(0xFF40260A), fontWeight: FontWeight.bold)),
          content: Text('Tento úkol jsi celý dokončil. Skvělá práce!',
              style: GoogleFonts.judson(color: const Color(0xFF6E3E09))),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK',
                  style: GoogleFonts.josefinSans(
                      color: const Color(0xFF9DAE7A), fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      );
      return;
    }

    if (progress.lastCompletedDate == today) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFFFFF3DC),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Text('Skvěle! 👏',
              style: GoogleFonts.judson(
                  color: const Color(0xFF40260A), fontWeight: FontWeight.bold)),
          content: Text('Tento úkol jsi dnes již splnil. Vrať se zítra na den ${progress.currentDay}.',
              style: GoogleFonts.judson(color: const Color(0xFF6E3E09))),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK',
                  style: GoogleFonts.josefinSans(
                      color: const Color(0xFF9DAE7A), fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      );
      return;
    }

    final isNew = progress.currentDay == 1 && progress.lastCompletedDate == null;
    if (isNew) {
      final canStart = await FirestoreService().canStartNewTask();
      if (!context.mounted) return;
      if (!canStart) {
        _showTaskLimitSheet(context);
        return;
      }
    }

    if (!context.mounted) return;
    Navigator.pushNamed(
      context,
      '/running_focus',
      arguments: TaskArgs(
        taskId: task.id,
        taskName: task.name,
        taskDescription: task.description,
        durationMinutes: task.durationMinutes,
        category: 'habit',
        currentDay: progress.currentDay,
        totalDays: task.totalDays,
      ),
    );
  }

  void _showTaskLimitSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF3DC),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD3A06B).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Příliš mnoho aktivních úkolů',
              style: GoogleFonts.judson(
                color: const Color(0xFF40260A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Máš již 2 aktivní úkoly. Dokonči nebo zruš jeden před zahájením nového.',
              textAlign: TextAlign.center,
              style: GoogleFonts.judson(color: const Color(0xFF6E3E09), fontSize: 15),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.pop(ctx),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF9DAE7A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Rozumím',
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelConfirmSheet(BuildContext context, AppTask task) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF3DC),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD3A06B).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ukončit tento úkol?',
              style: GoogleFonts.judson(
                color: const Color(0xFF40260A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Opravdu chceš ukončit tento úkol? Splněné dny budou uloženy.',
              textAlign: TextAlign.center,
              style: GoogleFonts.judson(color: const Color(0xFF6E3E09), fontSize: 15),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(ctx),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3D5C0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Pokračovat',
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFF6E3E09),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(ctx);
                      await FirestoreService().cancelTask(task.id);
                      if (mounted) _loadProgress();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE07B7B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Ukončit úkol',
                          style: GoogleFonts.josefinSans(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  void _showRestartConfirmSheet(BuildContext context, AppTask task) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFF3DC),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD3A06B).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Začít znovu?',
              style: GoogleFonts.judson(
                color: const Color(0xFF40260A),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tento úkol byl zrušen. Chceš ho začít znovu od dne 1?',
              textAlign: TextAlign.center,
              style: GoogleFonts.judson(color: const Color(0xFF6E3E09), fontSize: 15),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(ctx),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE3D5C0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Teď ne',
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFF6E3E09),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(ctx);
                      final canStart = await FirestoreService().canStartNewTask();
                      if (!context.mounted) return;
                      if (!canStart) {
                        _showTaskLimitSheet(context);
                        return;
                      }
                      await FirestoreService().restartTask(task.id);
                      if (!context.mounted) return;
                      _loadProgress();
                      Navigator.pushNamed(
                        context,
                        '/running_focus',
                        arguments: TaskArgs(
                          taskId: task.id,
                          taskName: task.name,
                          taskDescription: task.description,
                          durationMinutes: task.durationMinutes,
                          category: 'habit',
                          currentDay: 1,
                          totalDays: task.totalDays,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9DAE7A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Začít znovu',
                          style: GoogleFonts.josefinSans(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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

  Widget _taskCard(BuildContext context, AppTask task) {
    final progress = _progress[task.id] ?? TaskProgressModel.initial(task.id);
    final today = FirestoreService.dateKey(DateTime.now());
    final doneToday = progress.lastCompletedDate == today;
    final fullyDone = progress.currentDay > task.totalDays;
    final cancelled = progress.status == 'cancelled';
    final hasStarted = progress.currentDay > 1 || doneToday;
    final completedDays = progress.currentDay - 1;
    final displayDay = doneToday ? completedDays : progress.currentDay;

    return GestureDetector(
      onTap: () => _onTapTask(context, task),
      child: Opacity(
        opacity: (doneToday || fullyDone || cancelled) ? 0.65 : 1.0,
        child: Container(
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
            padding: const EdgeInsets.only(left: 17, right: 12, top: 12, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.name,
                        style: GoogleFonts.judson(
                          color: const Color(0xFF40260A),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (fullyDone)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9DAE7A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Splněno!',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                      )
                    else if (cancelled)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFAB8585),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Zrušeno',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                      )
                    else if (doneToday)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD3A06B),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('Zítra',
                            style: GoogleFonts.josefinSans(
                                color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                      ),
                    if (hasStarted && !fullyDone && !cancelled) ...[
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () => _showCancelConfirmSheet(context, task),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE07B7B).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: Color(0xFFE07B7B),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  task.description,
                  style: GoogleFonts.judson(
                    color: const Color(0xFF6E3E09),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 15, color: Color(0xFF6E3E09)),
                    const SizedBox(width: 4),
                    Text(
                      '${task.durationMinutes} min',
                      style: GoogleFonts.josefinSans(
                          color: const Color(0xFF6E3E09), fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 14),
                    const Icon(Icons.calendar_today_outlined, size: 15, color: Color(0xFF6E3E09)),
                    const SizedBox(width: 4),
                    Text(
                      '${task.totalDays} dní',
                      style: GoogleFonts.josefinSans(
                          color: const Color(0xFF6E3E09), fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    if (hasStarted && !fullyDone) ...[
                      const SizedBox(width: 14),
                      Image.asset('assets/images/fire.png', width: 15, height: 15),
                      const SizedBox(width: 4),
                      Text(
                        'Den $displayDay z ${task.totalDays}',
                        style: GoogleFonts.josefinSans(
                            color: const Color(0xFF6E3E09), fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ],
                ),
                if (hasStarted && !fullyDone) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: completedDays / task.totalDays,
                      backgroundColor: const Color(0xFFE3D5C0),
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9DAE7A)),
                      minHeight: 5,
                    ),
                  ),
                ],
                if (fullyDone) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const LinearProgressIndicator(
                      value: 1.0,
                      backgroundColor: Color(0xFFE3D5C0),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF9DAE7A)),
                      minHeight: 5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, size: 22, color: const Color.fromARGB(255, 63, 33, 12)),
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
              color: const Color.fromARGB(255, 254, 211, 165).withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE8D5BC).withValues(alpha: 0.5), width: 1),
              boxShadow: [
                BoxShadow(color: const Color(0xFF2C1E0C).withValues(alpha: 0.08), blurRadius: 30, offset: const Offset(0, 8)),
                BoxShadow(color: const Color(0xFF2C1E0C).withValues(alpha: 0.04), blurRadius: 6, offset: const Offset(0, 2)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(Icons.home_outlined, false,
                      () => Navigator.pushReplacementNamed(context, '/home')),
                  _navItem(Icons.calendar_month_outlined, false,
                      () => Navigator.pushReplacementNamed(context, '/calendar')),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, '/add_new_focus'),
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 242, 232),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 12, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: const Icon(Icons.add, size: 26, color: Color.fromARGB(255, 111, 66, 20)),
                    ),
                  ),
                  _navItem(Icons.bar_chart, false,
                      () => Navigator.pushReplacementNamed(context, '/statistic')),
                  _navItem(Icons.settings_outlined, false,
                      () => Navigator.pushReplacementNamed(context, '/settings')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 248, 228, 195),
      body: Stack(
        children: [
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
                    color: const Color.fromARGB(255, 237, 198, 160).withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
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
                      color: const Color.fromARGB(255, 209, 153, 98).withValues(alpha: 0.60),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: TopLeftBlob(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.60,
                    color: const Color.fromARGB(255, 218, 170, 121).withValues(alpha: 0.55),
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
                  color: const Color.fromARGB(110, 223, 171, 122).withValues(alpha: 0.40),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Vyber oblast',
                    style: GoogleFonts.judson(
                        color: const Color(0xFF6E3E09), fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: 345,
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF3E2),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_isHabit) {
                                setState(() => _isHabit = false);
                                Navigator.pushReplacementNamed(context, '/communication');
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: !_isHabit ? const Color(0xFFD3A06B) : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: !_isHabit
                                    ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 3))]
                                    : null,
                              ),
                              child: Text('Komunikace',
                                  style: GoogleFonts.judson(
                                      color: !_isHabit ? const Color(0xFFFDF3E2) : const Color(0xFF40260A),
                                      fontSize: 17,
                                      fontWeight: !_isHabit ? FontWeight.w700 : FontWeight.w500)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (!_isHabit) {
                                setState(() => _isHabit = true);
                                Navigator.pushReplacementNamed(context, '/habit');
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              height: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _isHabit ? const Color(0xFFD3A06B) : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: _isHabit
                                    ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 3))]
                                    : null,
                              ),
                              child: Text('Návyk',
                                  style: GoogleFonts.judson(
                                      color: _isHabit ? const Color(0xFFFDF3E2) : const Color(0xFF40260A),
                                      fontSize: 17,
                                      fontWeight: _isHabit ? FontWeight.w700 : FontWeight.w500)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Dnešní focus',
                      style: GoogleFonts.judson(
                          color: const Color.fromARGB(255, 77, 46, 13), fontSize: 43, fontWeight: FontWeight.bold)),
                  Text('Vyber jeden malý návyk',
                      style: GoogleFonts.judson(
                          color: const Color(0xFF6E3E09), fontSize: 22, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 110),
                      itemCount: habitTasks.length + _customTasks.length,
                      itemBuilder: (context, index) {
                        final task = index < habitTasks.length
                            ? habitTasks[index]
                            : _customTasks[index - habitTasks.length];
                        return _taskCard(context, task);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildNavBar(context),
        ],
      ),
    );
  }
}
