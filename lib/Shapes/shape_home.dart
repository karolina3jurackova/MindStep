import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height * 0.02); // ← ešte vyššie

    path.cubicTo(
      size.width * 1.0,
      size.height * 0.00,
      size.width * 0.90,
      size.height * 0.21,
      size.width * 0.75,
      size.height * 0.39,
    );

    // prehlbina
    path.cubicTo(
      size.width * 0.55,
      size.height * 0.57,
      size.width * 0.45,
      size.height * 0.63,
      size.width * 0.35,
      size.height * 0.60,
    );

    // kopček hore
    path.cubicTo(
      size.width * 0.20,
      size.height * 0.55,
      size.width * 0.10,
      size.height * 0.45,
      0,
      size.height * 0.50,
    );

    // dole na spodok
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
