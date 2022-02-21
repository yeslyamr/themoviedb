import 'dart:math';
import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final String child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
              percent: percent,
              fillColor: fillColor,
              lineColor: lineColor,
              freeColor: freeColor,
              lineWidth: lineWidth),
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: FittedBox(
              child: Center(
                  child: Text(
            child,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900),
          ))),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.lineWidth,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.percent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(size, canvas, arcRect);
    drawFilledArc(size, canvas, arcRect);
  }

  void drawFreeArc(Size size, Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    paint.color = freeColor;
    canvas.drawArc(arcRect, -pi / 2 + 2 * pi * percent, 2 * pi * (1 - percent),
        false, paint);
  }

  void drawFilledArc(Size size, Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;
    paint.color = lineColor;
    canvas.drawArc(arcRect, -pi / 2, 2 * pi * percent, false, paint);
  }

  Rect calculateArcsRect(Size size) {
    final linesMargin = size.width / 20;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
