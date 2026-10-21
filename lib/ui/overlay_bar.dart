import 'dart:math';

import 'package:flutter/material.dart';

class OverlayBar extends StatelessWidget {
  final Axis direction;
  final double padding;
  final double radius;
  final double startSize;
  final Color? startBackgroundColor;
  final Color? startForegroundColor;
  final double endSize;
  final Color? endBackgroundColor;
  final Color? endForegroundColor;
  final Widget child;

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
    required this.child
  }) :
    this.startSize = max(startSize, radius),
    this.endSize = max(endSize, radius);

  @override
  Widget build(BuildContext context) {
    final bool hasStartBackgroundBox = _hasBox(startSize, startBackgroundColor);
    final bool hasEndBackgroundBox = _hasBox(endSize, endBackgroundColor);
    final bool hasStartForegroundBox = _hasForegroundBox(
      startSize, startForegroundColor, padding, radius);
    final bool hasEndForegroundBox = _hasForegroundBox(
      endSize, endForegroundColor, padding, radius);

    return CustomPaint(
      painter: hasStartBackgroundBox || hasEndBackgroundBox
        ? _Painter(
            direction,
            startSize,
            startBackgroundColor,
            endSize,
            endBackgroundColor,
            hasStartBackgroundBox,
            hasEndBackgroundBox
          )
        : null,
      foregroundPainter: hasStartForegroundBox || hasEndForegroundBox
        ? _ForegroundPainter(
            direction,
            padding,
            radius,
            startSize,
            startForegroundColor,
            endSize,
            endForegroundColor,
            hasStartForegroundBox,
            hasEndForegroundBox
          )
        : null,
      child: child
    );
  }

  static bool _hasBox(double size, Color? color) {
    return size > 0 && color != null && color != Colors.transparent;
  }

  static bool _hasForegroundBox(double size, Color? color, double padding, double radius) {
    return _hasBox(size, color) && (padding > 0 || radius > 0);
  }
}

class _Painter extends CustomPainter {
  static final Paint _paint = Paint()
    ..isAntiAlias = false;

  final double startSize;
  final Color? startColor;
  final double endSize;
  final Color? endColor;
  final bool hasStartBox;
  final bool hasEndBox;
  late final bool isHorizontal;
  late final bool isVertical;

  _Painter(
    Axis direction,
    this.startSize,
    this.startColor,
    this.endSize,
    this.endColor,
    this.hasStartBox,
    this.hasEndBox
  ) :
    this.isHorizontal = direction == Axis.horizontal,
    this.isVertical = direction == Axis.vertical;

  @override
  void paint(Canvas canvas, Size size) {
    final double axisSize = isVertical ? size.height : size.width;

    if (hasStartBox) {
      _paint.color = startColor!;
      double factor = hasEndBox ? startSize / (startSize + endSize) : 1;
      double normalizedSize = min(startSize, axisSize * factor);
      canvas.drawRect(getStartRect(normalizedSize, size), _paint);
    }

    if (hasEndBox) {
      _paint.color = endColor!;
      double factor = hasStartBox ? endSize / (startSize + endSize) : 1;
      double normalizedSize = min(endSize, axisSize * factor);
      canvas.drawRect(getEndRect(normalizedSize, size), _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Rect getStartRect(double boxSize, Size canvasSize) {
    return Rect.fromLTRB(
      0, 0,
      isVertical ? canvasSize.width : boxSize,
      isVertical ? boxSize : canvasSize.height
    );
  }

  Rect getEndRect(double boxSize, Size canvasSize) {
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
    super.endColor,
    super.hasStartBox,
    super.hasEndBox
  );

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getClipPath(isHorizontal ? size.flipped : size);

    if (isHorizontal) {
      Matrix4 matrix = Matrix4.identity();
      matrix.translateByDouble(0, size.height, 0, 0);
      matrix.rotateZ(-90 * (pi / 180));
      path = path.transform(matrix.storage);
    }

    canvas.clipPath(path);

    super.paint(canvas, size);
  }

  Path getClipPath(Size canvasSize) {
    final Path path = Path();
    final double availableRadiusSize = min(canvasSize.width - padding * 2, canvasSize.height) / 2;
    final double startRadius = min(hasStartBox ? radius : 0, availableRadiusSize);
    final double endRadius = min(hasEndBox ? radius : 0, availableRadiusSize);
    final Radius startRadiusR = Radius.circular(startRadius);
    final Radius endRadiusR = Radius.circular(endRadius);

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
}