import 'package:flutter/material.dart';

class ShapeRunningFocus extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Pozadie
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()..color = const Color.fromARGB(255, 248, 221, 183),
    );

    // =========================
    // SVETLÝ TVAR - väčší, vyššie
    // =========================
    final Paint lightPaint = Paint()
      ..color = const Color(0xFFF2B579).withValues(alpha: 0.30)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final double offsetY = -h * 0.13;

    final Path lightPath = Path()
      ..moveTo(0, h)
      ..lineTo(0, h * 0.64)
      ..cubicTo(
        w * 0.06,
        h * 0.62 + offsetY,
        w * 0.15,
        h * 0.63 + offsetY,
        w * 0.28,
        h * 0.65 + offsetY,
      )
      ..cubicTo(
        w * 0.42,
        h * 0.67 + offsetY,
        w * 0.50,
        h * 0.70 + offsetY, // 👈 menej hlboké
        w * 0.62,
        h * 0.69 + offsetY,
      )
      ..cubicTo(
        w * 0.78,
        h * 0.67 + offsetY,
        w * 0.90,
        h * 0.54 + offsetY,
        w,
        h * 0.36 + offsetY,
      )
      ..lineTo(w, h)
      ..close();

    canvas.drawPath(lightPath, lightPaint);

    // =========================
    // TMAVÝ TVAR - menší, nižšie
    // =========================
    final Paint darkPaint = Paint()
      ..color = const Color(0xFFE5AB6E).withValues(alpha: 1.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
    ;

    final Path darkPath = Path()
      ..moveTo(0, h)
      ..lineTo(0, h * 0.79)
      ..cubicTo(
        w * 0.06,
        h * 0.64,
        w * 0.15,
        h * 0.65,
        w * 0.28,
        h * 0.68,
      )
      ..cubicTo(
        w * 0.42,
        h * 0.72,
        w * 0.50,
        h * 0.82,
        w * 0.62,
        h * 0.80,
      )
      ..cubicTo(
        w * 0.78,
        h * 0.76,
        w * 0.90,
        h * 0.56,
        w,
        h * 0.36,
      )
      ..lineTo(w, h)
      ..close();

    canvas.drawPath(darkPath, darkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
