import 'dart:math' as Math;

import 'package:flutter/material.dart';

class OverlayBar extends CustomPaint {
  final Axis direction;
  final double padding;
  final double radius;
  final double startSize;
  final Color? startBackgroundColor;
  final Color? startForegroundColor;
  final double endSize;
  final Color? endBackgroundColor;
  final Color? endForegroundColor;

  OverlayBar({
    this.direction = Axis.vertical,
    this.padding = 0,
    this.radius = 0,
    double startSize = 0,
    this.startBackgroundColor,
    this.startForegroundColor,
    double endSize = 0,
    this.endBackgroundColor,
    this.endForegroundColor,
    required super.child
  })
    : this.startSize = Math.max(radius, startSize),
      this.endSize = Math.max(radius, endSize),
      super(
        painter: _Painter(
          direction,
          Math.max(radius, startSize),
          startBackgroundColor,
          Math.max(radius, endSize),
          endBackgroundColor
        ),
        foregroundPainter: _ForegroundPainter(
          direction,
          padding,
          radius,
          Math.max(radius, startSize),
          startForegroundColor,
          Math.max(radius, endSize),
          endForegroundColor
        )
      );
}


class _Painter extends CustomPainter {
  static final Paint _paint = Paint()
    ..isAntiAlias = false;

  final Axis direction;
  final double startSize;
  final Color? startColor;
  final double endSize;
  final Color? endColor;
  late final bool hasStartBox;
  late final bool hasEndBox;

  _Painter(this.direction, this.startSize, this.startColor, this.endSize, this.endColor) {
    this.hasStartBox = hasBox(startSize, startColor);
    this.hasEndBox = hasBox(endSize, endColor);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (hasStartBox || hasEndBox) {
      final double startSizeFactor = hasEndBox ? startSize / (startSize + endSize) : 1;
      final double endSizeFactor = hasStartBox ? endSize / (startSize + endSize) : 1;
      final double axisSize = direction == Axis.vertical ? size.height : size.width;
      final double normalizedStartSize = Math.min(startSize, startSizeFactor * axisSize);
      final double normalizedEndSize = Math.min(endSize, endSizeFactor * axisSize);

      if (hasStartBox) {
        _paint.color = startColor!;
        Rect rect = getStartRect(normalizedStartSize, size);
        canvas.drawRect(rect, _paint);
      }

      if (hasEndBox) {
        _paint.color = endColor!;
        Rect rect = getEndRect(normalizedEndSize, size);
        canvas.drawRect(rect, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  bool hasBox(double size, Color? color) {
    return
      size > 0 &&
      color != null &&
      color != Colors.transparent;
  }

  Rect getStartRect(double boxSize, Size canvasSize) {
    bool isVertical = direction == Axis.vertical;
    return Rect.fromLTRB(
      0,
      0,
      isVertical ? canvasSize.width : boxSize,
      isVertical ? boxSize : canvasSize.height
    );
  }

  Rect getEndRect(double boxSize, Size canvasSize) {
    bool isVertical = direction == Axis.vertical;
    return Rect.fromLTRB(
      isVertical ? 0 : canvasSize.width - boxSize,
      isVertical ? canvasSize.height - boxSize : 0,
      canvasSize.width,
      canvasSize.height
    );
  }
}


class _ForegroundPainter extends _Painter {
  final double padding;
  final double radius;

  _ForegroundPainter(
    super.direction,
    this.padding,
    this.radius,
    super.startSize,
    super.startColor,
    super.endSize,
    super.endColor
  );

  @override
  void paint(Canvas canvas, Size size) {
    if (hasStartBox || hasEndBox) {
      final bool isHorizontal = direction == Axis.horizontal;

      Path path = _getClipPath(
        padding,
        hasStartBox ? radius : 0,
        hasEndBox ? radius : 0,
        isHorizontal ? size.flipped : size
      );

      if (isHorizontal) {
        Matrix4 matrix = Matrix4.identity();
        matrix.translateByDouble(0, size.height, 0, 0);
        matrix.rotateZ(-90 * (Math.pi / 180));
        path = path.transform(matrix.storage);
      }

      canvas.clipPath(path);
    }
    super.paint(canvas, size);
  }

  @override
  bool hasBox(double size, Color? color) {
    return
      super.hasBox(size, color) &&
      (padding > 0 || radius > 0);
  }
}


Path _getClipPath(double padding, double startRadius, double endRadius, Size canvasSize) {
  final double availableRadiusSize =
    Math.min(canvasSize.width - padding * 2, canvasSize.height) / 2;
  startRadius = Math.min(startRadius, availableRadiusSize);
  endRadius = Math.min(endRadius, availableRadiusSize);
  final Radius startRadiusR = Radius.circular(startRadius);
  final Radius endRadiusR = Radius.circular(endRadius);
  final Path path = Path();

  path.lineTo(padding + startRadius, 0);
  path.arcToPoint(
    Offset(padding, startRadius),
    radius: startRadiusR,
    clockwise: false
  );
  path.lineTo(padding, canvasSize.height - endRadius);
  path.arcToPoint(
    Offset(padding + endRadius, canvasSize.height),
    radius: endRadiusR,
    clockwise: false
  );
  path.lineTo(canvasSize.width - padding - endRadius, canvasSize.height);
  path.arcToPoint(
    Offset(canvasSize.width - padding, canvasSize.height - endRadius),
    radius: endRadiusR,
    clockwise: false
  );
  path.lineTo(canvasSize.width - padding, startRadius);
  path.arcToPoint(
    Offset(canvasSize.width - padding - startRadius, 0),
    radius: startRadiusR,
    clockwise: false
  );
  path.lineTo(canvasSize.width, 0);
  path.lineTo(canvasSize.width, canvasSize.height);
  path.lineTo(0, canvasSize.height);
  path.close();

  return path;
}