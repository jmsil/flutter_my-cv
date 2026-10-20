import 'package:flutter/material.dart';

import '../layout/theme.dart';

class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? effectColor;
  final void Function()? onPressed;
  final void Function(bool)? onHover;
  final Widget child;

  AppInkResponse({
    this.padding,
    this.effectColor,
    this.onPressed,
    this.onHover,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final Color builtEffectColor = effectColor?.inkEffectAlpha ?? Colors.transparent;
    final InteractiveInkFeatureFactory splashFactory = effectColor == null
      ? NoSplash.splashFactory
      : InkRipple.splashFactory;

    Widget? builtChild = child;

    if (padding != null) {
      builtChild = Padding(
        padding: padding!,
        child: builtChild
      );
    }

    return InkResponse(
      focusColor: Colors.transparent,
      hoverColor: builtEffectColor,
      splashColor: builtEffectColor,
      highlightColor: builtEffectColor,
      highlightShape: BoxShape.rectangle,
      splashFactory: splashFactory,
      mouseCursor: onPressed == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      onTap: onPressed ?? () {},
      onHover: onHover,
      child: builtChild
    );
  }
}