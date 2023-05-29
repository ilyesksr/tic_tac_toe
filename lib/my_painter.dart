import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final Color color;
  late Paint painter;
  late Offset startPoint;
  late Offset endPoint;
  MyPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    painter = Paint()
      ..color = color
      ..strokeWidth = 3;
    startPoint = Offset(0 + 10, size.height / 2);
    endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
