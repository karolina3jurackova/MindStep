import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/Shapes/shape_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 213, 180),
      body: Stack(
        children: [
          // BLOB 1 — väčší, vľavo
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
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.58,
            child: Center(
              child: Text(
                'Welcome Back!',
                style: GoogleFonts.judson(
                  color: const Color(0xFF6E3E09),
                  fontSize: 45,
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
              height: size.height * 0.55,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 254, 241, 218),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOG IN',
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
                        labelText: 'Your username',
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
                    const SizedBox(height: 50),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
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
