import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RoundedOverlay extends StatelessWidget {
  final Axis direction;
  final double padding;
  final double radius;
  final double startSize;
  final Color? startColor;
  final bool startWithBackground;
  final double endSize;
  final Color? endColor;
  final bool endWithBackground;
  final Widget child;

  RoundedOverlay({
    this.direction = Axis.vertical,
    this.padding = 0,
    required this.radius,
    double startSize = 0,
    this.startColor,
    this.startWithBackground = false,
    double endSize = 0,
    this.endColor,
    this.endWithBackground = false,
    required this.child
  })
    : this.startSize = Math.max(radius, startSize),
      this.endSize = Math.max(radius, endSize);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final bool isVertical = direction == Axis.vertical;
    final bool hasStart = startColor != null && startColor != Colors.transparent;
    final bool hasEnd = endColor != null && endColor != Colors.transparent;
    final Alignment startAlignment = isVertical ? Alignment.topCenter : Alignment.centerLeft;
    final Alignment endAlignment = isVertical ? Alignment.bottomCenter : Alignment.centerRight;

    if (hasStart && startWithBackground) {
      Widget box = _BackgroundBox(startAlignment, isVertical, startSize, startColor!);
      children.add(box);
    }

    if (hasEnd && endWithBackground) {
      Widget box = _BackgroundBox(endAlignment, isVertical, endSize, endColor!);
      children.add(box);
    }

    children.add(child);

    if (hasStart) {
      Widget clip = _ForegroundBox(
        startAlignment, isVertical ? 0 : -1, padding, radius, startSize, startColor!
      );
      children.add(clip);
    }

    if (hasEnd) {
      Widget clip = _ForegroundBox(
        endAlignment, isVertical ? 2 : 1, padding, radius, endSize, endColor!
      );
      children.add(clip);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: children
    );
  }
}

class _Box extends ColoredBox {
  _Box(bool isVertical, double size, Color color)
    : super(
        color: color,
        isAntiAlias: false,
        child: SizedBox(
          width: isVertical ? double.infinity : size,
          height: isVertical ? size : double.infinity
        )
      );
}

class _BackgroundBox extends Align {
  _BackgroundBox(Alignment alignment, bool isVertical, double size, Color color)
    : super(
        alignment: alignment,
        child: _Box(isVertical, size, color)
      );
}

class _ForegroundBox extends Align {
  _ForegroundBox(
    Alignment alignment, int rotation, double padding, double radius, double size, Color color
  )
    : super (
        alignment: alignment,
        child: RotatedBox(
          quarterTurns: rotation,
          child: ClipPath(
            clipBehavior: Clip.hardEdge,
            clipper: _CustomPath(padding, radius),
            child: _Box(true, size, color)
          )
        )
      );
}

class _CustomPath extends CustomClipper<Path> {
  final double padding;
  final double radius;

  _CustomPath(this.padding, this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(padding + radius, 0);
    path.arcToPoint(
      Offset(padding, radius),
      radius: Radius.circular(radius),
      clockwise: false
    );
    path.lineTo(padding, size.height);
    path.lineTo(size.width - padding, size.height);
    path.lineTo(size.width - padding, radius);
    path.arcToPoint(
      Offset(size.width - padding - radius, 0),
      radius: Radius.circular(radius),
      clockwise: false
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}