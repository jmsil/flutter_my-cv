import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_provider.dart';

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

class AppMaterialButton extends MaterialButton {
  AppMaterialButton(
    AppTheme theme, IconData icon, String text,
    {
      super.onPressed
    }
  ) : super(
    color: theme.overBackgroundColor2.withValues(alpha: 0.16),
    elevation: 0,
    hoverElevation: 0,
    focusElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    hoverColor: theme.inkEffectsColor,
    splashColor: theme.inkEffectsColor,
    highlightColor: theme.inkEffectsColor,
    shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
    child: Padding(
      padding: const AppEdgeInsets.small(),
      child: Row(
        spacing: AppLayout.smallSpacing,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: theme.overBackgroundColor2),
          Text(text, style: theme.text1OverBackgroundColor2BoldStyle)
        ]
      ),
    )
  );
}