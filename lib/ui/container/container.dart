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
  final bool hasShadow;
  final bool isClipped;
  final Widget? child;

  AppContainer({
    this.width,
    this.height,
    this.color,
    this.margin,
    this.padding,
    this.borderSize = 1,
    this.borderColor,
    this.borderRadius = BorderRadius.zero,
    this.hasShadow = false,
    this.isClipped = false,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? rWidget = child;
    final bool hasBorder = borderColor != null && borderSize > 0;

    if (padding != null || hasBorder) {
      rWidget = Padding(
        padding:
          (padding ?? EdgeInsets.zero) +
          (hasBorder ? EdgeInsets.all(borderSize) : EdgeInsets.zero),
        child: rWidget
      );
    }

    rWidget = Material(
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
      shadowColor: Colors.black,
      elevation: hasShadow ? 6 : 0,
      clipBehavior: isClipped ? Clip.hardEdge : Clip.none,
      child: rWidget
    );

    if (width != null || height != null) {
      rWidget = ConstrainedBox(
        constraints: BoxConstraints.expand(width: width, height: height),
        child: rWidget
      );
    }

    if (margin != null) {
      rWidget = Padding(
        padding: margin!,
        child: rWidget
      );
    }

    return rWidget;
  }
}