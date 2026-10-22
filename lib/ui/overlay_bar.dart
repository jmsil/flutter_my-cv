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
  final Widget? child;

  OverlayBar({
    this.direction = Axis.vertical,
    this.padding = 0,
    this.radius = 0,
    this.startSize = 0,
    this.startBackgroundColor,
    this.startForegroundColor,
    this.endSize = 0,
    this.endBackgroundColor,
    this.endForegroundColor,
    this.child
  });

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
            direction == Axis.vertical,
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
            direction == Axis.vertical,
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

  final bool isVertical;
  final double startSize;
  final Color? startColor;
  final double endSize;
  final Color? endColor;
  final bool hasStartBox;
  final bool hasEndBox;

  _Painter(
    this.isVertical,
    this.startSize,
    this.startColor,
    this.endSize,
    this.endColor,
    this.hasStartBox,
    this.hasEndBox
  );

  @override
  void paint(Canvas canvas, Size size) {
    final double canvasAxisSize = isVertical ? size.height : size.width;

    if (hasStartBox) {
      _paint.color = startColor!;
      double factor = hasEndBox ? startSize / (startSize + endSize) : 1;
      double normalizedSize = min(startSize, canvasAxisSize * factor);
      canvas.drawRect(getStartRect(normalizedSize, size), _paint);
    }

    if (hasEndBox) {
      _paint.color = endColor!;
      double factor = hasStartBox ? endSize / (startSize + endSize) : 1;
      double normalizedSize = min(endSize, canvasAxisSize * factor);
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
  final double horizontalPadding;
  final double verticalPadding;
  final double radius;

  _ForegroundPainter(
    super.isVertical,
    double padding,
    this.radius,
    super.startSize,
    super.startColor,
    super.endSize,
    super.endColor,
    super.hasStartBox,
    super.hasEndBox
  ) :
    this.horizontalPadding = isVertical ? padding : 0,
    this.verticalPadding = isVertical ? 0 : padding;

  @override
  void paint(Canvas canvas, Size size) {
    Path? path = getClipPath(size);

    if (path != null)
      canvas.clipPath(path, doAntiAlias: false);

    super.paint(canvas, size);
  }

  Path? getClipPath(Size canvasSize) {
    if (
      canvasSize.width - horizontalPadding * 2 <= 0 ||
      canvasSize.height - verticalPadding * 2 <= 0
    )
      return null;

    final double availableRadiusSize =
      min(canvasSize.width - horizontalPadding * 2, canvasSize.height - verticalPadding * 2) / 2;

    final Radius normalizedRadius = availableRadiusSize > 0
      ? Radius.circular(min(radius, availableRadiusSize))
      : Radius.zero;

    final Radius startRadius = hasStartBox ? normalizedRadius : Radius.zero;
    final Radius endRadius = hasEndBox ? normalizedRadius : Radius.zero;

    final rect = RRect.fromLTRBAndCorners(
      horizontalPadding,
      verticalPadding,
      canvasSize.width - horizontalPadding,
      canvasSize.height - verticalPadding,
      topLeft: startRadius,
      topRight: isVertical ? startRadius : endRadius,
      bottomLeft: isVertical ? endRadius : startRadius,
      bottomRight: endRadius
    );

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Offset.zero & canvasSize),
      Path()..addRRect(rect)
    );
  }
}