import 'package:flutter/material.dart';

class MyCustomRenderBox extends RenderBox {
  final double radius;

  MyCustomRenderBox({required this.radius});

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawCircle(offset + Offset(size.width / 2, size.height / 2), radius, paint);
  }
}
