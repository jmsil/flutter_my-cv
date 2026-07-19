import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/layout_provider.dart';
import '../layout/theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;

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
    required this.color,
    bool isLoading = false,
    this.isSelected = false,
    required this.onPressed
  })
    : child = isLoading
        ? SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 3,
              backgroundColor: color.withValues(alpha: 0.26)
            )
          )
        : Icon(icon, size: _iconSize, color: color);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    return IconButton(
      iconSize: _containerSize,
      splashColor: theme.inkEffectsColor,
      hoverColor: theme.inkEffectsColor,
      highlightColor: theme.inkEffectsColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        color: isSelected ? color.withValues(alpha: 0.16) : null,
        borderRadius: AppTheme.circleBorderRadius,
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed
    );
  }
}