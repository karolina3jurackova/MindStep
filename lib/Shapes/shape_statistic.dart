import 'dart:math' as math;
import 'package:flutter/material.dart';

class ShapeStatistic extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Pozadie
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()..color = const Color.fromARGB(255, 248, 221, 183),
    );

    // Pravý dolný roh
    _drawCornerMotif(
      canvas,
      size,
      isTopLeft: false,
      scaleX: 1.0, // natiahnuť cez celú šírku
      scaleY: 0.58, // zmenšiť len výšku
    );

    // Ľavý horný roh
    _drawCornerMotif(
      canvas,
      size,
      isTopLeft: true,
      scaleX: 1.0, // natiahnuť cez celú šírku
      scaleY: 0.58, // zmenšiť len výšku
    );
  }

  void _drawCornerMotif(
    Canvas canvas,
    Size size, {
    required bool isTopLeft,
    required double scaleX,
    required double scaleY,
  }) {
    final double w = size.width;
    final double h = size.height;

    canvas.save();

    if (isTopLeft) {
      // otočenie o 180°
      canvas.translate(w / 2, h / 2);
      canvas.rotate(math.pi);
      canvas.translate(-w / 2, -h / 2);
    }

    // ukotvenie do pravého dolného rohu pôvodného motívu
    canvas.translate(
      w * (1 - scaleX),
      h * (1 - scaleY),
    );

    // samostatné škálovanie
    canvas.scale(scaleX, scaleY);

    // =========================
    // SVETLÝ TVAR - väčší, vyššie
    // =========================
    final Paint lightPaint = Paint()
      ..color = const Color.fromARGB(159, 230, 178, 126).withValues(alpha: 0.45)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
      ..isAntiAlias = true;

    final double offsetY = -h * 0.20;

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
        h * 0.70 + offsetY,
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
      ..color = const Color.fromARGB(200, 224, 176, 124)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3)
      ..isAntiAlias = true;

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

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
