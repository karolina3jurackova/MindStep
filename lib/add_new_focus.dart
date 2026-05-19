import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_focus.dart';
import 'package:adv_basics/services/firestore_service.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewFocus extends StatefulWidget {
  const AddNewFocus({super.key});

  @override
  State<AddNewFocus> createState() => _AddNewFocusState();
}

class _AddNewFocusState extends State<AddNewFocus> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  int _selectedTotalDays = 14;
  int _selectedMinutes = 10;
  bool _isSaving = false;

  final List<int> _dayOptions = [5, 7, 10, 14, 21, 30];
  final List<int> _minuteOptions = [5, 8, 10, 12, 15, 20, 25, 30];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Zadej název úkolu.',
            style: GoogleFonts.josefinSans(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF9E7A50),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await FirestoreService().saveCustomTask(
        name: name,
        description: _descriptionController.text.trim(),
        category: 'habit',
        durationMinutes: _selectedMinutes,
        totalDays: _selectedTotalDays,
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/habit');
    } catch (_) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Nepodařilo se uložit. Zkus to znovu.',
              style: GoogleFonts.josefinSans(color: Colors.white),
            ),
            backgroundColor: const Color(0xFF9E7A50),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 205, 157),
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ShapeFocus(),
              child: const SizedBox.expand(),
            ),
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),

                  // BACK ARROW
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, '/habit'),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF5C3310),
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Center(
                    child: Text(
                      'Přidat nový focus',
                      style: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 98, 60, 19),
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // NAME
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Název návyku',
                            style: GoogleFonts.judson(
                              color: const Color.fromARGB(255, 90, 55, 17),
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildTextField(
                          controller: _nameController,
                          label: 'Název návyku',
                        ),
                        const SizedBox(height: 10),

                        _buildTextField(
                          controller: _descriptionController,
                          label: 'Krátký popis (volitelné)',
                        ),

                        const SizedBox(height: 28),

                        // DURATION IN DAYS
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Délka trvání (dny)',
                            style: GoogleFonts.judson(
                              color: const Color.fromARGB(255, 90, 55, 17),
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildDropdown<int>(
                          value: _selectedTotalDays,
                          items: _dayOptions,
                          label: (v) => '$v dní',
                          onChanged: (v) =>
                              setState(() => _selectedTotalDays = v!),
                        ),

                        const SizedBox(height: 28),

                        // SESSION LENGTH
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Délka sezení',
                            style: GoogleFonts.judson(
                              color: const Color.fromARGB(255, 90, 55, 17),
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildDropdown<int>(
                          value: _selectedMinutes,
                          items: _minuteOptions,
                          label: (v) => '$v minut',
                          onChanged: (v) =>
                              setState(() => _selectedMinutes = v!),
                        ),

                        const SizedBox(height: 44),

                        // SAVE BUTTON
                        GestureDetector(
                          onTap: _isSaving ? null : _save,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 3),
                            decoration: BoxDecoration(
                              color: _isSaving
                                  ? const Color.fromARGB(255, 172, 190, 135)
                                      .withValues(alpha: 0.6)
                                  : const Color.fromARGB(255, 172, 190, 135),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: _isSaving
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: Colors.black
                                            .withValues(alpha: 0.12),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                            ),
                            child: _isSaving
                                ? const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Text(
                                    'ULOŽIT',
                                    style: GoogleFonts.judson(
                                      color: Colors.white,
                                      fontSize: 34,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T value,
    required List<T> items,
    required String Function(T) label,
    required ValueChanged<T?> onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFD3A06B),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFFFEE6CA),
          iconEnabledColor: Colors.white,
          selectedItemBuilder: (context) => items
              .map((v) => Center(
                    child: Text(
                      label(v),
                      style: GoogleFonts.josefinSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ))
              .toList(),
          items: items
              .map((v) => DropdownMenuItem<T>(
                    value: v,
                    child: Text(
                      label(v),
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFF40260A),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      style: GoogleFonts.josefinSans(
        color: const Color(0xFF40260A),
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.josefinSans(
          color: const Color(0xFF9E7A50),
          fontWeight: FontWeight.w600,
          fontSize: 16,
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
        fillColor: const Color(0xFFFEE6CA).withValues(alpha: 0.5),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}
