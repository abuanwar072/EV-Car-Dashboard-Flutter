import 'package:flutter/material.dart';

import '../constants.dart';

class GearPrinter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    double strokeWith = 2;

    Path leftPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.17, size.height * 0.5)
      ..lineTo(size.width * 0.34, size.height * 0.5)
      ..lineTo(size.width * 0.42, 0)
      ..lineTo(size.width * 0.48, 0)
      ..lineTo(size.width * 0.48, strokeWith)
      ..lineTo(size.width * 0.42, strokeWith)
      ..lineTo(size.width * 0.34, size.height * 0.5 + strokeWith)
      ..lineTo(size.width * 0.17, size.height * 0.5 + strokeWith)
      ..close();

    Path rightPath = Path()
      ..moveTo(size.width * 0.52, 0)
      ..lineTo(size.width * 0.58, 0)
      ..lineTo(size.width * 0.66, size.height * 0.5)
      ..lineTo(size.width * 0.83, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.83, size.height * 0.5 + strokeWith)
      ..lineTo(size.width * 0.66, size.height * 0.5 + strokeWith)
      ..lineTo(size.width * 0.58, strokeWith)
      ..lineTo(size.width * 0.52, strokeWith)
      ..close();

    canvas.drawPath(leftPath, paint);
    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
