import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/Shapes/shape_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$',
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'user-not-found':
      case 'invalid-credential':
        return 'Nesprávný e-mail nebo heslo.';
      case 'wrong-password':
        return 'Nesprávné heslo.';
      case 'invalid-email':
        return 'Zadej platnou e-mailovou adresu.';
      case 'user-disabled':
        return 'Tento účet byl zablokován.';
      case 'network-request-failed':
        return 'Chyba sítě. Zkontroluj připojení.';
      case 'too-many-requests':
        return 'Příliš mnoho pokusů. Zkus to znovu později.';
      default:
        return 'Přihlášení se nezdařilo. Zkus to znovu.';
    }
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || !_emailRegex.hasMatch(email)) {
      _showError('Zadej platnou e-mailovou adresu.');
      return;
    }
    if (password.isEmpty) {
      _showError('Zadej heslo.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      _showError(_mapFirebaseError(e.code));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.josefinSans(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9E7A50),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 213, 180),
      body: Stack(
        children: [
          // ── Decorative blobs (behind everything) ──────────────────────────

          Positioned(
            left: 0,
            top: 0,
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: ClipPath(
                    clipper: LeftBlob(),
                    child: Container(
                      width: size.width * 0.75,
                      height: size.height * 0.55,
                      color: const Color(0xFFE3A868),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: LeftBlob(),
                  child: Container(
                    width: size.width * 0.75,
                    height: size.height * 0.55,
                    color: const Color.fromARGB(174, 220, 157, 90),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: ClipPath(
                    clipper: RightBlob(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.65,
                      color: const Color.fromARGB(157, 227, 167, 104),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: RightBlob(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.60,
                    color: const Color.fromARGB(193, 228, 174, 116),
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
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Vítej zpět!',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF6E3E09),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
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
                        left: 60,
                        right: 60,
                        top: 60,
                        bottom: safeBottom + 40,
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PŘIHLÁSIT SE',
                          style: GoogleFonts.josefinSans(
                            color: const Color(0xFF6E3E09),
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // EMAIL
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: GoogleFonts.josefinSans(
                              color: const Color(0xFF6E3E09),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color(0xFFE3A868), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color(0xFF6E3E09), width: 1.5),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // PASSWORD
                        TextField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          decoration: InputDecoration(
                            labelText: 'Heslo',
                            labelStyle: GoogleFonts.josefinSans(
                              color: const Color(0xFF6E3E09),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
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
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color(0xFFE3A868), width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Color(0xFF6E3E09), width: 1.5),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                          ),
                        ),
                        const SizedBox(height: 50),

                        // LOGIN BUTTON
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _login,
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
                                    'LOGIN',
                                    style: GoogleFonts.josefinSans(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 2,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // REGISTER LINK
                        Center(
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed('/register'),
                            child: Text(
                              'Nemáš účet? Zaregistruj se',
                              style: GoogleFonts.josefinSans(
                                color: const Color(0xFF6E3E09),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
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
}
