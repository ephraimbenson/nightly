import 'dart:math';
import 'package:flutter/material.dart';

class WelcomePagePainter extends CustomPainter {
  WelcomePagePainter({this.color = Colors.yellow});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    _drawBackground(canvas, shapeBounds);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds) {
    final paint = Paint()..color = color;
    final backgroundPath = Path()
      // ..moveTo(shapeBounds.left + 200, shapeBounds.top + 500)
      // ..arcTo(shapeBounds, -pi, pi, false)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..close();
    canvas.drawPath(backgroundPath, paint);
    final blackPaint = Paint()..color = Colors.black;

    canvas.drawArc(
        new Rect.fromLTWH(0, 0, shapeBounds.width, shapeBounds.height * 2),
        pi,
        pi,
        false,
        Paint()..color = Colors.yellow);

    canvas.drawArc(
        new Rect.fromLTWH(shapeBounds.width / 4, shapeBounds.height / 2,
            shapeBounds.width / 2, shapeBounds.height),
        pi,
        pi,
        false,
        blackPaint);
  }

  @override
  bool shouldRepaint(WelcomePagePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
