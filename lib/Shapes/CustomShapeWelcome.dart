import 'package:flutter/material.dart';

class BottomLeftBlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);

    // horná hrana
    path.lineTo(size.width * 0.01, size.height * 0.001);

    // jemný zvislý oblúk dole
    path.cubicTo(
      size.width * 0.30,
      size.height * 0.00,
      size.width * 0.26,
      size.height * 0.22,
      size.width * 0.34,
      size.height * 0.38,
    );

    // mäkké vtiahnutie a prechod doprava
    path.cubicTo(
      size.width * 0.40,
      size.height * 0.52,
      size.width * 0.66,
      size.height * 0.56,
      size.width * 0.82,
      size.height * 0.74,
    );

    // veľký spodný oblúk
    path.cubicTo(
      size.width * 0.94,
      size.height * 0.88,
      size.width * 0.99,
      size.height * 0.96,
      size.width,
      size.height,
    );

    // spodná a ľavá hrana
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TopRightBlobClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(size.width * (1 - 0.01), size.height * (1 - 0.001));

    path.cubicTo(
      size.width * (1 - 0.30),
      size.height * (1 - 0.00),
      size.width * (1 - 0.26),
      size.height * (1 - 0.22),
      size.width * (1 - 0.34),
      size.height * (1 - 0.38),
    );

    path.cubicTo(
      size.width * (1 - 0.40),
      size.height * (1 - 0.52),
      size.width * (1 - 0.66),
      size.height * (1 - 0.56),
      size.width * (1 - 0.82),
      size.height * (1 - 0.74),
    );

    path.cubicTo(
      size.width * (1 - 0.94),
      size.height * (1 - 0.88),
      size.width * (1 - 0.99),
      size.height * (1 - 0.96),
      0,
      0,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
