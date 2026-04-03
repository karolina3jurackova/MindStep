import 'package:flutter/material.dart';

// ĽAVÝ HORNÝ BLOB
class TopLeftBlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // vlna dole doprava — škára
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.1,
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.4,
      size.height * 0.52,
    );

    path.cubicTo(
      size.width * 0.40,
      size.height * 0.68,
      size.width * 0.15,
      size.height * 0.80,
      0,
      size.height,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomRightBlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);

    // 1. jemný nábeh zľava hore
    path.cubicTo(
      size.width * 0.08,
      size.height * 0.82,
      size.width * 0.18,
      size.height * 0.60,
      size.width * 0.34,
      size.height * 0.46,
    );

    // 2. plynulé pokračovanie bez špice
    path.cubicTo(
      size.width * 0.48,
      size.height * 0.34,
      size.width * 0.72,
      size.height * 0.36,
      size.width,
      size.height * 0.22,
    );

    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
