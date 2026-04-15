import 'package:flutter/material.dart';

class ShapeCalendarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE3A868).withValues(alpha: 0.53)
      ..style = PaintingStyle.fill;

    // HORNÝ TVAR
    final topPath = Path();
    topPath.moveTo(0, 0);
    topPath.lineTo(size.width, 0);
    topPath.lineTo(size.width, size.height * 0.23);

    topPath.cubicTo(
      size.width * 0.82,
      size.height * 0.18,
      size.width * 0.68,
      size.height * 0.10,
      size.width * 0.48,
      size.height * 0.12,
    );

    topPath.cubicTo(
      size.width * 0.26,
      size.height * 0.14,
      size.width * 0.08,
      size.height * 0.28,
      0,
      size.height * 0.38,
    );

    topPath.close();
    canvas.drawPath(topPath, paint);

    // DOLNÝ TVAR
    final bottomPath = Path();
    bottomPath.moveTo(0, size.height * 0.82);

    bottomPath.cubicTo(
      size.width * 0.10,
      size.height * 0.76,
      size.width * 0.28,
      size.height * 0.79,
      size.width * 0.42,
      size.height * 0.83,
    );

    bottomPath.cubicTo(
      size.width * 0.58,
      size.height * 0.88,
      size.width * 0.80,
      size.height * 0.76,
      size.width,
      size.height * 0.6,
    );

    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();

    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
