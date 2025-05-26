import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double gapWidth;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashWidth = 6,
    this.gapWidth = 3,
    this.borderRadius = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final Path path = Path()..addRRect(rRect);
    final Path dashedPath = _createDashedPath(path);

    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path path) {
    final PathMetrics pathMetrics = path.computeMetrics();
    final Path dashedPath = Path();

    for (final PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;

      while (distance < pathMetric.length) {
        final double nextDistance = distance + dashWidth;
        if (nextDistance > pathMetric.length) break;

        dashedPath.addPath(
          pathMetric.extractPath(distance, nextDistance),
          Offset.zero,
        );

        distance += dashWidth + gapWidth;
      }
    }

    return dashedPath;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
