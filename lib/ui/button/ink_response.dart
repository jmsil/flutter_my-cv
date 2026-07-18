import 'package:flutter/material.dart';

class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color effectsColor;
  final void Function()? onPressed;
  final void Function(bool)? onHover;
  final Widget child;

  AppInkResponse({
    this.padding,
    required this.effectsColor,
    this.onPressed,
    this.onHover,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? newChild = child;

    if (padding != null) {
      newChild = Padding(
        padding: padding!,
        child: newChild
      );
    }

    return InkResponse(
      focusColor: Colors.transparent,
      hoverColor: effectsColor,
      splashColor: effectsColor,
      highlightColor: effectsColor,
      highlightShape: BoxShape.rectangle,
      splashFactory: InkRipple.splashFactory,
      mouseCursor: onPressed == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      onTap: onPressed ?? () {},
      onHover: onHover,
      child: newChild
    );
  }
}