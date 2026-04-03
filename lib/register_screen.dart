import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:adv_basics/Shapes/shape_register.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 213, 180),
      body: Stack(
        children: [
          // ĽAVÝ HORNÝ BLOB
          Positioned(
            left: 0,
            top: 0,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
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
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
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

          // PRAVÝ DOLNÝ BLOB
          Positioned(
            right: -10,
            bottom: 500,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
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
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.63,
            child: Center(
              child: Text(
                'Create your account!',
                style: GoogleFonts.judson(
                  color: const Color(0xFF6E3E09),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // SVETLÝ OBDĹŽNIK
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: size.height * 0.60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 254, 241, 218),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back to login
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        '< Back to login',
                        style: GoogleFonts.josefinSans(
                          color: const Color(0xFF6E3E09),
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // SIGN UP nadpis
                    Text(
                      'SIGN UP',
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFF6E3E09),
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Meno
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'What do your friends call you?',
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

                    // Email
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
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

                    // Password
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    const SizedBox(height: 28),

                    // SIGN IN button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE3A868),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          elevation: 8,
                          shadowColor: Colors.black.withValues(alpha: 1),
                        ),
                        child: Text(
                          'SIGN IN',
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
    );
  }
}
