import 'dart:math' as Math;

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
  })
    : this.startSize = Math.max(radius, startSize),
      this.endSize = Math.max(radius, endSize);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final bool isVertical = direction == Axis.vertical;
    final Alignment startAlignment = isVertical ? Alignment.topCenter : Alignment.centerLeft;
    final Alignment endAlignment = isVertical ? Alignment.bottomCenter : Alignment.centerRight;
    final bool hasStartBackgroundBox = _hasBackgroundBox(startSize, startBackgroundColor);
    final bool hasStartForegroundBox = _hasForegroundBox(startSize, startForegroundColor);
    final bool hasEndBackgroundBox = _hasBackgroundBox(endSize, endBackgroundColor);
    final bool hasEndForegroundBox = _hasForegroundBox(endSize, endForegroundColor);

    if (hasStartBackgroundBox) {
      Widget box = _BackgroundBox(startAlignment, isVertical, startSize, startBackgroundColor!);
      children.add(box);
    }

    if (hasEndBackgroundBox) {
      Widget box = _BackgroundBox(endAlignment, isVertical, endSize, endBackgroundColor!);
      children.add(box);
    }

    children.add(child);

    if (hasStartForegroundBox) {
      Widget box = _ForegroundBox(
        startAlignment, isVertical ? 0 : -1, padding, radius, startSize, startForegroundColor!
      );
      children.add(box);
    }

    if (hasEndForegroundBox) {
      Widget box = _ForegroundBox(
        endAlignment, isVertical ? 2 : 1, padding, radius, endSize, endForegroundColor!
      );
      children.add(box);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: children
    );
  }

  bool _hasBackgroundBox(double size, Color? color) {
    return size > 0 && _hasColor(color);
  }

  bool _hasForegroundBox(double size, Color? color) {
    return size > 0 && _hasColor(color) && (padding > 0 || radius > 0);
  }

  bool _hasColor(Color? color) {
    return color != null && color != Colors.transparent;
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