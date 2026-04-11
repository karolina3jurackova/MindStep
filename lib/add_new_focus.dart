import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_focus.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewFocus extends StatefulWidget {
  const AddNewFocus({super.key});

  @override
  State<AddNewFocus> createState() => _AddNewFocusState();
}

class _AddNewFocusState extends State<AddNewFocus> {
  final _habitNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _minutesController = TextEditingController();
  int _selectedDuration = 10;

  final List<int> _durationOptions = [3, 5, 8, 10, 15, 20, 25, 30];

  @override
  void dispose() {
    _habitNameController.dispose();
    _descriptionController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: ShapeFocus(),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  // ŠIPKA SPÄŤ
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/habit',
                      );
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF5C3310),
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // NADPIS
                  Center(
                    child: Text(
                      'Add your Habit', //Tu bude Add new focus pri vytvorenie komunikácie
                      style: GoogleFonts.judson(
                        color: const Color.fromARGB(255, 98, 60, 19),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 44),

                  // KARTA S OBSAHOM
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // HABIT NAME
                        Text(
                          'Habit name', //Tu bude communication pri vytvorenie komunikácie
                          style: GoogleFonts.judson(
                            color: const Color.fromARGB(255, 90, 55, 17),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 22),

                        _buildTextField(
                          controller: _habitNameController,
                          label: 'Habit name',
                        ),
                        const SizedBox(height: 12),

                        _buildTextField(
                          controller: _descriptionController,
                          label: 'Short description',
                        ),

                        const SizedBox(height: 28),

                        // DURATION
                        Text(
                          'Duration (days)',
                          style: GoogleFonts.judson(
                            color: const Color.fromARGB(255, 90, 55, 17),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD3A06B),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: _selectedDuration,
                              isExpanded: true,
                              dropdownColor: const Color(0xFFFEE6CA),
                              iconEnabledColor: Colors.white,
                              selectedItemBuilder: (context) {
                                return _durationOptions.map((val) {
                                  return Center(
                                    child: Text(
                                      '$val days',
                                      style: GoogleFonts.josefinSans(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              items: _durationOptions.map((val) {
                                return DropdownMenuItem<int>(
                                  value: val,
                                  child: Text(
                                    '$val days',
                                    style: GoogleFonts.josefinSans(
                                      color: const Color(0xFF40260A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => _selectedDuration = val);
                                }
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // SESSION LENGTH
                        Text(
                          'Session length',
                          style: GoogleFonts.judson(
                            color: const Color.fromARGB(255, 90, 55, 17),
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        SizedBox(
                          width: 180,
                          child: _buildTextField(
                            controller: _minutesController,
                            label: 'Minutes',
                            keyboardType: TextInputType.number,
                          ),
                        ),

                        const SizedBox(height: 40),

                        // SAVE -  TOTO PRESMERUJE NA buď komunikáciu alebo habit, ale tiež
                        // po stlačení by sa mala uložit zadefinovaná komunikace/habit do databázy, aby sa zobrazila v TODAYS FOCUS
                        GestureDetector(
                          onTap: () {
                            // TODO
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 53, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 172, 190, 135),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'SAVE',
                              style: GoogleFonts.judson(
                                color: Colors.white,
                                fontSize: 37,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 120),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
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
