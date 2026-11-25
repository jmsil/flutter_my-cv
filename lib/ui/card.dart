import 'package:flutter/widgets.dart';

import 'container.dart';
import 'hover.dart';
import 'layout/layout_model.dart';

class AppCard extends StatelessWidget {
  final EdgeInsets? padding;
  final BorderRadius borderRadius;
  final bool enableHoverEffect;
  final Widget child;

  AppCard({
    this.padding,
    this.borderRadius = AppTheme.allBorderRadius,
    this.enableHoverEffect = false,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;

    if (enableHoverEffect) {
      return AppHover(
        builder: (BuildContext context, bool hovered, Widget? child) {
          return _Container(
            themeData: themeData,
            padding: padding,
            borderRadius: borderRadius,
            hovered: hovered,
            child: child
          );
        },
        child: child
      );
    }

    return _Container(
      themeData: themeData,
      padding: padding,
      borderRadius: borderRadius,
      hovered: false,
      child: child
    );
  }
}

class _Container extends AppContainer {
  _Container({
    required AppThemeData themeData,
    required super.padding,
    required super.borderRadius,
    required bool hovered,
    required super.child
  }) : super(
    color: hovered
      ? themeData.surfaceColor2.withMidDecorationAlpha
      : themeData.surfaceColor2.withCardFillAlpha,
    borderColor: themeData.surfaceColor2.withHighDecorationAlpha
  );
}