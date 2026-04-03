import 'package:flutter/material.dart';

class TopLeftBlob extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 1.8, 0);

    // horný dlhý oblúk
    path.cubicTo(
      size.width * 1.2,
      size.height * 0.02,
      size.width * 1.02,
      size.height * 0.16,
      size.width * 0.72,
      size.height * 0.26,
    );

    // plynulé vtlačenie dovnútra
    path.cubicTo(
      size.width * 0.48,
      size.height * 0.33,
      size.width * 0.30,
      size.height * 0.40,
      size.width * 0.40,
      size.height * 0.56,
    );

    // spodné mäkké rozšírenie
    path.cubicTo(
      size.width * 0.48,
      size.height * 0.70,
      size.width * 0.20,
      size.height * 0.79,
      0,
      size.height * 0.79,
    );

    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class RightSoftBlob extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 1.8, 0);

    // horný dlhý oblúk
    path.cubicTo(
      size.width * 5.0,
      size.height * 0.02,
      size.width * 1.00,
      size.height * 0.16,
      size.width * 0.72,
      size.height * 0.26,
    );

    // jemné vtlačenie dovnútra - plynulé pokračovanie
    path.cubicTo(
      size.width * 0.58,
      size.height * 0.31,
      size.width * 0.50,
      size.height * 0.40,
      size.width * 0.56,
      size.height * 0.52,
    );

    // spodné mäkké rozšírenie
    path.cubicTo(
      size.width * 0.50,
      size.height * 0.68,
      size.width * 0.24,
      size.height * 0.74,
      0,
      size.height * 0.84,
    );

    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomRightBlob extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.72);

    path.cubicTo(
      0, // úplne na kraji
      size.height * 0.62,
      size.width * 0.34,
      size.height * 1.1,
      size.width * 0.56,
      size.height * 0.52,
    );

    path.cubicTo(
      size.width * 0.78,
      size.height * 0.26,
      size.width * 0.92,
      size.height * 0.20,
      size.width,
      size.height * 0.18,
    );

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
