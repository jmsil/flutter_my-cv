import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double borderSize;
  final Color? borderColor;
  final BorderRadius borderRadius;
  final bool isClipped;
  final Widget? child;

  AppContainer({
    super.key,
    this.width,
    this.height,
    this.color,
    this.margin,
    this.padding,
    this.borderSize = 1,
    this.borderColor,
    this.borderRadius = BorderRadius.zero,
    this.isClipped = false,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? builtWidget = child;
    final bool hasBorder = borderColor != null && borderSize > 0;

    if (padding != null || hasBorder) {
      builtWidget = Padding(
        padding:
          (padding ?? EdgeInsets.zero) +
          (hasBorder ? EdgeInsets.all(borderSize) : EdgeInsets.zero),
        child: builtWidget
      );
    }

    builtWidget = Material(
      color: color,
      type: color == null ? MaterialType.transparency : MaterialType.canvas,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: hasBorder
          ? BorderSide(
              width: borderSize,
              color: borderColor!
            )
          : BorderSide.none
      ),
      clipBehavior: isClipped ? Clip.hardEdge : Clip.none,
      child: builtWidget
    );

    if (width != null || height != null) {
      builtWidget = ConstrainedBox(
        constraints: BoxConstraints.expand(width: width, height: height),
        child: builtWidget
      );
    }

    if (margin != null) {
      builtWidget = Padding(
        padding: margin!,
        child: builtWidget
      );
    }

    return builtWidget;
  }
}