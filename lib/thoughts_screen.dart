import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_thoughts.dart';
import 'package:adv_basics/models/task_args.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';

class ThoughtsScreen extends StatefulWidget {
  final TaskArgs args;
  const ThoughtsScreen({super.key, required this.args});

  @override
  State<ThoughtsScreen> createState() => _ThoughtsScreenState();
}

class _ThoughtsScreenState extends State<ThoughtsScreen> {
  int? _selectedMood;
  bool _isSaving = false;
  bool _showMoodError = false;
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

  Future<void> _handleDone() async {
    if (_selectedMood == null) {
      setState(() => _showMoodError = true);
      return;
    }
    setState(() => _isSaving = true);
    try {
      await FirestoreService().completeTaskAndSaveReflection(
        taskName: widget.args.taskName,
        taskDescription: widget.args.taskDescription,
        moodIndex: _selectedMood!,
        note: _notesController.text,
        durationMinutes: widget.args.durationMinutes,
        category: widget.args.category,
      );
      if (widget.args.taskId.isNotEmpty) {
        await FirestoreService().updateTaskProgress(
          widget.args.taskId,
          widget.args.currentDay + 1,
        );
      }
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    } catch (_) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nepodařilo se uložit. Zkus to znovu.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool canDone = _selectedMood != null && !_isSaving;

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
                  Image.asset(
                    'assets/images/reading.PNG',
                    width: 160,
                    height: 160,
                    errorBuilder: (_, __, ___) => const SizedBox(height: 160),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Skvělá práce!',
                    style: GoogleFonts.judson(
                      color: const Color(0xFF40260A),
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.args.taskName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.judson(
                      color: const Color(0xFF6E3E09),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36).withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Jak ses cítil/a?',
                          style: GoogleFonts.judson(
                            color: const Color(0xFF6E3E09),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: const Color.fromARGB(255, 94, 63, 36).withValues(alpha: 0.5),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(_moodAssets.length, (index) {
                      final isSelected = _selectedMood == index;
                      return GestureDetector(
                        onTap: () => setState(() {
                          _selectedMood = index;
                          _showMoodError = false;
                        }),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected
                                ? const Color(0xFF7A5230).withValues(alpha: 0.15)
                                : Colors.transparent,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF7A5230).withValues(alpha: 0.5)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: AnimatedScale(
                            scale: isSelected ? 1.15 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: Image.asset(_moodAssets[index], width: 60, height: 60),
                          ),
                        ),
                      );
                    }),
                  ),
                  if (_showMoodError) ...[
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Color(0xFFB85C38),
                          size: 15,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Vyber náladu pro pokračování.',
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFFB85C38),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Chceš si něco poznamenat?',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF40260A),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _notesController,
                    minLines: 1,
                    maxLines: null,
                    style: GoogleFonts.judson(
                      color: const Color(0xFF40260A),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Napiš své myšlenky...',
                      hintStyle: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 107, 81, 51),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFD3A06B), width: 1.2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Color(0xFFD3A06B), width: 1.8),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFFF3DC).withValues(alpha: 0.6),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: _isSaving ? null : _handleDone,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                      decoration: BoxDecoration(
                        color: _isSaving
                            ? const Color(0xFFBBBBBB)
                            : _selectedMood != null
                                ? const Color.fromARGB(255, 169, 187, 133)
                                : const Color(0xFFCEC4B6),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: _selectedMood != null && !_isSaving
                            ? [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 15, offset: const Offset(0, 6))]
                            : [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 6, offset: const Offset(0, 3))],
                      ),
                      child: _isSaving
                          ? const SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                            )
                          : Text(
                              'HOTOVO',
                              style: GoogleFonts.judson(
                                color: Colors.white,
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
