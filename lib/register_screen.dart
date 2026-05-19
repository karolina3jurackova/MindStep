import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adv_basics/Shapes/shape_register.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _passwordVisible = false;

  String? _nameError;
  String? _emailError;
  String? _passwordError;

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ── validation ────────────────────────────────────────────────

  String? _validateName(String v) {
    if (v.isEmpty) return 'Zadej své jméno.';
    return null;
  }

  String? _validateEmail(String v) {
    if (v.isEmpty) return 'Zadej svůj e-mail.';
    if (!_emailRegex.hasMatch(v)) {
      return 'Zadej platný e-mail (např. name@example.com).';
    }
    return null;
  }

  String? _validatePassword(String v) {
    if (v.length < 8) return 'Heslo musí mít alespoň 8 znaků.';
    if (!v.contains(RegExp(r'[0-9]'))) {
      return 'Heslo musí obsahovat alespoň jedno číslo.';
    }
    return null;
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Účet s tímto e-mailem již existuje.';
      case 'invalid-email':
        return 'Zadej platnou e-mailovou adresu.';
      case 'weak-password':
        return 'Heslo je příliš slabé. Zvol silnější.';
      case 'network-request-failed':
        return 'Chyba sítě. Zkontroluj připojení.';
      case 'too-many-requests':
        return 'Příliš mnoho pokusů. Zkus to znovu později.';
      default:
        return 'Registrace se nezdařila. Zkus to znovu.';
    }
  }

  // ── submit ────────────────────────────────────────────────────

  Future<void> _register() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text; // intentional — do not trim

    final nameErr = _validateName(name);
    final emailErr = _validateEmail(email);
    final passErr = _validatePassword(password);

    setState(() {
      _nameError = nameErr;
      _emailError = emailErr;
      _passwordError = passErr;
    });

    if (nameErr != null || emailErr != null || passErr != null) return;

    setState(() => _isLoading = true);
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user?.updateDisplayName(name);
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      final msg = _mapFirebaseError(e.code);
      if (mounted) setState(() => _emailError = msg);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // ── build ─────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 213, 180),
      body: Stack(
        children: [
          // ── Decorative blobs (behind everything) ────────────────────────

          Positioned(
            left: 0,
            top: 0,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: ClipPath(
                      clipper: TopLeftBlobClipper(),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.43,
                        color: const Color.fromARGB(255, 227, 168, 104),
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.05,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ClipPath(
                      clipper: TopLeftBlobClipper(),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.43,
                        color: const Color.fromARGB(255, 227, 168, 104),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: TopLeftBlobClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.40,
                    color: const Color.fromARGB(195, 227, 167, 104),
                  ),
                ),
              ],
            ),
          ),

          // Right blob — proportional bottom so it stays in the header area.
          Positioned(
            right: -10,
            bottom: size.height * 0.59,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: ClipPath(
                      clipper: BottomRightBlobClipper(),
                      child: Container(
                        width: size.width * 0.70,
                        height: size.height * 0.48,
                        color: const Color.fromARGB(234, 227, 167, 104),
                      ),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.05,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ClipPath(
                      clipper: BottomRightBlobClipper(),
                      child: Container(
                        width: size.width * 0.70,
                        height: size.height * 0.48,
                        color: const Color.fromARGB(234, 227, 167, 104),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: BottomRightBlobClipper(),
                  child: Container(
                    width: size.width * 0.68,
                    height: size.height * 0.48,
                    color: const Color.fromARGB(187, 228, 174, 117),
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Vytvoř si účet!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.judson(
                          color: const Color(0xFF6E3E09),
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 254, 241, 218),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: 32,
                        right: 32,
                        top: 36,
                        bottom: safeBottom + 40,
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/login'),
                          child: Text(
                            '< Zpět na přihlášení',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF6E3E09),
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        Text(
                          'REGISTROVAT SE',
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFF6E3E09),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // NAME
                        _buildTextField(
                          controller: _nameController,
                          label: 'Jak ti říkají přátelé?',
                          errorText: _nameError,
                          onChanged: (_) {
                            if (_nameError != null) {
                              setState(() => _nameError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 10),

                        // EMAIL
                        _buildTextField(
                          controller: _emailController,
                          label: 'E-mail',
                          keyboardType: TextInputType.emailAddress,
                          errorText: _emailError,
                          onChanged: (_) {
                            if (_emailError != null) {
                              setState(() => _emailError = null);
                            }
                          },
                        ),
                        const SizedBox(height: 10),

                        // PASSWORD
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Heslo',
                          obscure: !_passwordVisible,
                          errorText: _passwordError,
                          onChanged: (_) {
                            if (_passwordError != null) {
                              setState(() => _passwordError = null);
                            }
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF9E7A50),
                              size: 20,
                            ),
                            onPressed: () => setState(
                                () => _passwordVisible = !_passwordVisible),
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Password hint
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            'Min. 8 znaků, alespoň jedno číslo.',
                            style: GoogleFonts.josefinSans(
                              color: const Color(0xFF9E7A50),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // SIGN UP BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE3A868),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14),
                              elevation: 8,
                              shadowColor:
                                  Colors.black.withValues(alpha: 1),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'REGISTROVAT SE',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
    String? errorText,
    ValueChanged<String>? onChanged,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        suffixIcon: suffixIcon,
        labelStyle: GoogleFonts.josefinSans(
          color: const Color(0xFF6E3E09),
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: GoogleFonts.josefinSans(
          color: const Color(0xFFB85C38),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: errorText != null
                ? const Color(0xFFB85C38)
                : const Color(0xFFE3A868),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: errorText != null
                ? const Color(0xFFB85C38)
                : const Color(0xFF6E3E09),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFFB85C38), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Color(0xFFB85C38), width: 1.5),
        ),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}
