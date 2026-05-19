import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/Shapes/CustomShapeWelcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 243, 226, 1),
      body: Stack(
        children: [
          /// TOP RIGHT BLOB
          Positioned(
            right: 0,
            top: 0,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                    child: ClipPath(
                      clipper: TopRightBlobClipper(),
                      child: Container(
                        width: size.width * 0.7,
                        height: size.height * 0.43,
                        color: const Color.fromARGB(255, 223, 187, 147),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: TopRightBlobClipper(),
                  child: Container(
                    width: size.width * 0.72,
                    height: size.height * 0.43,
                    color: const Color.fromARGB(130, 242, 207, 170),
                  ),
                ),
              ],
            ),
          ),

          /// BOTTOM LEFT BLOB
          Positioned(
            left: 0,
            bottom: 0,
            child: Stack(
              children: [
                Transform.scale(
                  scale: 1.12,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: ClipPath(
                      clipper: BottomLeftBlobClipper(),
                      child: Container(
                        width: size.width * 0.66,
                        height: size.height * 0.43,
                        color: const Color.fromARGB(234, 227, 167, 104),
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: BottomLeftBlobClipper(),
                  child: Container(
                    width: size.width * 0.50,
                    height: size.height * 0.43,
                    color: const Color.fromARGB(188, 227, 167, 104),
                  ),
                ),
              ],
            ),
          ),

          /// MAIN CONTENT
          Positioned.fill(
            child: SafeArea(
              child: Align(
                alignment: const Alignment(0, -0.25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    Image.asset(
                      'assets/images/welcome_dragon.png',
                      width: 270,
                    ),
                    Text(
                      'TVŮJ MALÝ KROK',
                      style: GoogleFonts.josefinSans(
                        color: const Color(0xFF40260A),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2,
                        height: 0.65,
                      ),
                    ),
                    Text(
                      'MindStep',
                      style: GoogleFonts.judson(
                        color: const Color(0xFF6E3E09),
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE3A868),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withValues(alpha: 0.2),
                      ),
                      child: Text(
                        'PŘIHLÁSIT SE',
                        style: GoogleFonts.josefinSans(
                          color: const Color(0xFFFDF3E2),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// SIGN UP
          Positioned(
            bottom: 40,
            right: 40,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/register');
              },
              child: Text(
                'REGISTRACE >',
                style: GoogleFonts.josefinSans(
                  color: const Color(0xFF40260A),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//treba tu potom vyriešiť že keď uživateľ sa prihlásil a neodhlásil tak zostane prihlásený