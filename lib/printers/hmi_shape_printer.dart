import 'package:flutter/material.dart';

import '../constants.dart';

class HmiShapePrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Let's say this is our starting point
    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * 0.13, size.height * 0.05)
      ..lineTo(size.width * 0.31, 0)
      ..lineTo(size.width * 0.39, size.height * 0.11)
      ..lineTo(size.width * 0.60, size.height * 0.11)
      ..lineTo(size.width * 0.69, 0)
      ..lineTo(size.width * 0.87, size.height * 0.05)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width * 0.87, size.height)
      ..lineTo(size.width * 0.13, size.height)
      ..close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..color = primaryColor;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
