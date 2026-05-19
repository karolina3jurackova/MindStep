import 'package:flutter/material.dart';

class ShapeRunningFocus extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double bottom = h + 2; // bleed 2px to eliminate any gap at the edge

    // Background
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, bottom),
      Paint()..color = const Color.fromARGB(255, 248, 221, 183),
    );

    // Light wave — starts lower so it stays near the bottom
    final Paint lightPaint = Paint()
      ..color = const Color(0xFFF2B579).withValues(alpha: 0.30)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final Path lightPath = Path()
      ..moveTo(0, bottom)
      ..lineTo(0, h * 0.72)
      ..cubicTo(
        w * 0.06,
        h * 0.70,
        w * 0.15,
        h * 0.71,
        w * 0.28,
        h * 0.73,
      )
      ..cubicTo(
        w * 0.42,
        h * 0.75,
        w * 0.50,
        h * 0.78,
        w * 0.62,
        h * 0.76,
      )
      ..cubicTo(
        w * 0.78,
        h * 0.73,
        w * 0.90,
        h * 0.62,
        w,
        h * 0.50,
      )
      ..lineTo(w, bottom)
      ..close();

    canvas.drawPath(lightPath, lightPaint);

    // Dark wave — slightly below the light wave
    final Paint darkPaint = Paint()
      ..color = const Color(0xFFE5AB6E).withValues(alpha: 1.0)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    final Path darkPath = Path()
      ..moveTo(0, bottom)
      ..lineTo(0, h * 0.91)
      ..cubicTo(
        w * 0.06,
        h * 0.72,
        w * 0.15,
        h * 0.73,
        w * 0.28,
        h * 0.76,
      )
      ..cubicTo(
        w * 0.42,
        h * 0.80,
        w * 0.50,
        h * 0.88,
        w * 0.62,
        h * 0.86,
      )
      ..cubicTo(
        w * 0.78,
        h * 0.82,
        w * 0.90,
        h * 0.66,
        w,
        h * 0.52,
      )
      ..lineTo(w, bottom)
      ..close();

    canvas.drawPath(darkPath, darkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
