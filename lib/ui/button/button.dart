import 'package:flutter/material.dart';

import '../const.dart';
import '../container/container.dart';
import '../theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;
  static final Color effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

  final Color color;
  final bool isSelected;
  final Widget child;
  final void Function() onPressed;

  AppButton.label({
    required String label,
    required TextStyle selectedStyle,
    required TextStyle unselectedStyle,
    required this.isSelected,
    required this.onPressed
  })
    : color = isSelected ? selectedStyle.color! : unselectedStyle.color!,
      child = Text(label, style: isSelected ? selectedStyle : unselectedStyle);

  AppButton.icon({
    required IconData icon,
    Color? color,
    bool isLoading = false,
    this.isSelected = false,
    required this.onPressed
  })
    : this.color = color ?? AppTheme.lightBlue,
      child = isLoading
        ? SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 3,
              backgroundColor: (color ?? AppTheme.lightBlue).withValues(alpha: 0.26)
            )
          )
        : Icon(
            icon,
            size: _iconSize,
            color: color ?? AppTheme.lightBlue
          );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: _containerSize,
      splashColor: effectsColor,
      hoverColor: effectsColor,
      highlightColor: effectsColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        color: isSelected ? color.withValues(alpha: 0.16) : null,
        borderRadius: AppUiConst.circleBorderRadius,
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed
    );
  }
}