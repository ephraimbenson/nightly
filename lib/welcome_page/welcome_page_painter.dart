import 'package:flutter/material.dart';

const dotRadius = 1.5;

class WelcomePagePainter extends CustomPainter {
  WelcomePagePainter({this.color = Colors.yellow});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    _drawGridBackground(canvas, shapeBounds);
  }

  void _drawGridBackground(Canvas canvas, Rect shapeBounds) {
    final paint = Paint()..color = color;
    for (var x = -10.0; x < shapeBounds.width; x += 20) {
      for (var y = 70.0; y < shapeBounds.height; y += 20) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(WelcomePagePainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
