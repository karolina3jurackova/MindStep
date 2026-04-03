import 'package:flutter/material.dart';

class LeftBlob extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.55, 0);

    // okrúhla časť vpravo hore
    path.cubicTo(
      size.width * 0.90,
      0,
      size.width * 0.90,
      size.height * 0.25,
      size.width * 0.55,
      size.height * 0.35,
    );

    // vlna dovnútra doľava
    path.cubicTo(
      size.width * 0.08,
      size.height * 0.42,
      size.width * 0.025,
      size.height * 0.55,
      0,
      size.height * 0.75,
    );

    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// PRAVÝ BLOB — zrkadlový tvar
class RightBlob extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // začiatok hore vpravo
    path.moveTo(size.width, 0);

    // malá vlnka hore
    path.cubicTo(
      size.width * 0.78,
      size.height * 0.01,
      size.width * 0.72,
      size.height * 0.08,
      size.width * 0.72,
      size.height * 0.16,
    );

// veľká vlna dole doprava — plynulé napojenie
    path.cubicTo(
      size.width * 0.72,
      size.height * 0.24, // ← začína tam kde skončila predošlá
      size.width * 0.9, size.height * 0.45,
      size.width * 0.50, size.height * 0.48,
    );

// plynulý chvost dole doľava
    path.cubicTo(
      size.width * 0.08,
      size.height * 0.50,
      size.width * 0.00,
      size.height * 0.70,
      size.width * 0.00,
      size.height * 1.0,
    );

// spodná hrana doprava
    path.lineTo(size.width, size.height * 1.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
