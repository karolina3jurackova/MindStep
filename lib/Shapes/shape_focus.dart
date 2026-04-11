import 'package:flutter/material.dart';

class ShapeFocus extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    const Color bgColor = Color.fromARGB(255, 244, 205, 157); // hlavné pozadie
    const Color topWaveColor = Color(0xFFE0AB70); // vrchná tmavšia vlna
    const Color cardColor = Color.fromARGB(255, 254, 230, 202); // karta
    const Color bottomDark = Color(0xFFE2BB89); // spodná tmavšia vlna v karte
    const Color bottomLight =
        Color.fromARGB(161, 236, 203, 157); // vrchná svetlejšia vlna v karte

    // ===== 1. Pozadie =====
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()..color = bgColor,
    );

    // ===== 2. Horná vlna na pozadí =====
    final double offsetBig = -h * 0.08;

    final Path topWave = Path()
      ..moveTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h * 0.10 + offsetBig)

      // malá vlna vpravo (jemná)
      ..cubicTo(
        w * 0.92,
        h * 0.20 + offsetBig,
        w * 0.82,
        h * 0.26 + offsetBig,
        w * 0.70,
        h * 0.22 + offsetBig,
      )

      // HLAVNÁ veľká vlna (toto je kľúč)
      ..cubicTo(
        w * 0.40,
        h * 0.11 + offsetBig,
        w * 0.23,
        h * 0.34 + offsetBig,
        0,
        h * 0.36 + offsetBig,
      )
      ..close();

    canvas.drawPath(
      topWave,
      Paint()..color = topWaveColor,
    );

    // ===== 3. Karta =====
    final double cardLeft = 0;
    final double cardTop = h * 0.20;
    final double cardWidth = w;
    final double cardHeight = h * 0.78;

    final RRect card = RRect.fromRectAndCorners(
      Rect.fromLTWH(cardLeft, cardTop, cardWidth, cardHeight),
      topLeft: const Radius.circular(42),
      topRight: const Radius.circular(42),
      bottomLeft: const Radius.circular(42),
      bottomRight: const Radius.circular(42),
    );

    // tieň karty
    canvas.drawRRect(
      card.shift(const Offset(0, 4)),
      Paint()
        ..color = Colors.black.withValues(alpha: 0.06)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    // výplň karty
    canvas.drawRRect(
      card,
      Paint()..color = cardColor,
    );

    // všetko ďalšie orežeme do karty
    canvas.save();
    canvas.clipRRect(card);

    // ===== 4. Svetlejšia spodná vlna v karte =====
    final double lightOffset = cardHeight * 0.02;
    final Path lightWave = Path()
      ..moveTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, cardTop + cardHeight * 0.72)
      ..cubicTo(
        w * 0.86,
        cardTop + cardHeight * 0.82,
        w * 0.68,
        cardTop + cardHeight * 0.96,
        w * 0.50,
        cardTop + cardHeight * 0.90,
      )
      ..cubicTo(
        w * 0.36,
        cardTop + cardHeight * 0.82 + lightOffset,
        w * 0.20,
        cardTop + cardHeight * 0.78 + lightOffset,
        0,
        cardTop + cardHeight * 0.84 + lightOffset,
      )
      ..close();

    canvas.drawPath(
      lightWave,
      Paint()..color = bottomLight,
    );

    // ===== 5. Tmavšia spodná vlna úplne naspodu karty =====
    final double offset = cardHeight * 0.08;

    final Path darkWave = Path()
      ..moveTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, cardTop + cardHeight * 0.72 + offset)
      ..cubicTo(
        w * 0.86,
        cardTop + cardHeight * 0.82 + offset,
        w * 0.68,
        cardTop + cardHeight * 0.96 + offset,
        w * 0.50,
        cardTop + cardHeight * 0.90 + offset,
      )
      ..cubicTo(
        w * 0.36,
        cardTop + cardHeight * 0.82 + offset,
        w * 0.20,
        cardTop + cardHeight * 0.78 + offset,
        0,
        cardTop + cardHeight * 0.84 + offset,
      )
      ..close();

    canvas.drawPath(
      darkWave,
      Paint()..color = bottomDark,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
