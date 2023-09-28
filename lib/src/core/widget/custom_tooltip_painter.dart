import 'package:flutter/material.dart';

class CustomTooltipPainter extends CustomPainter {
  final double borderRadius;
  final double triangleWidth;
  final double triangleHeight;

  CustomTooltipPainter({
    super.repaint,
    this.borderRadius = 8.0,
    this.triangleWidth = 12.0,
    this.triangleHeight = 10.0,
  });

  final Paint _paint = Paint()
    ..color = Colors.red
    ..strokeWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // draw the bottom triangle
    _drawTriangle(
      canvas,
      width: width,
      height: height,
    );

    // draw the rounded box
    _drawTooltipBox(
      canvas,
      width: width,
      height: height,
    );
  }

  void _drawTriangle(
    Canvas canvas, {
    required double width,
    required double height,
  }) {
    canvas.save();

    // translate by borderRadius
    canvas.translate(-borderRadius, 0.0);

    final Path trianglePath = Path()
      ..moveTo(width - triangleWidth, height)
      ..lineTo(width - triangleWidth / 2, triangleHeight + height)
      ..lineTo(width, height)
      ..lineTo(width - triangleWidth, height);

    canvas.drawPath(trianglePath, _paint);

    canvas.restore();
  }

  void _drawTooltipBox(
    Canvas canvas, {
    required double width,
    required double height,
  }) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, width, height);
    final RRect border = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    canvas.drawRRect(border, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
