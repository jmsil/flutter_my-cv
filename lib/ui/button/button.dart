import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_model.dart';
import '../text.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;

  final Color color;
  final bool isSelected;
  final bool _isProcessing;
  final Widget child;
  final void Function() onPressed;

  AppButton.label({
    required String label,
    required TextStyle selectedStyle,
    required TextStyle unselectedStyle,
    required this.isSelected,
    required this.onPressed
  }) :
    _isProcessing = false,
    color = isSelected ? selectedStyle.color! : unselectedStyle.color!,
    child = Text(label, style: isSelected ? selectedStyle : unselectedStyle);

  AppButton.icon({
    required IconData icon,
    required this.color,
    bool isProcessing = false,
    this.isSelected = false,
    required this.onPressed
  }) :
    _isProcessing = isProcessing,
    child = Icon(icon, size: _iconSize, color: color);

  @override
  Widget build(BuildContext context) {
    final Color inkEffectColor = color.withInkEffectAlpha;

    final builtChild = _isProcessing
      ? SizedBox(
          width: _iconSize,
          height: _iconSize,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: 3,
            backgroundColor: color.withValues(alpha: 0.26)
          )
        )
      : child;

    return IconButton(
      iconSize: _containerSize,
      splashColor: inkEffectColor,
      hoverColor: inkEffectColor,
      highlightColor: inkEffectColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        color: isSelected ? color.withButtonFrameAlpha : null,
        borderRadius: AppTheme.circleBorderRadius,
        child: Center(child: builtChild)
      ),
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed
    );
  }
}

class AppMaterialButton extends MaterialButton {
  AppMaterialButton(
    IconData icon, String text, TextStyle textStyle,
    {
      super.onPressed
    }
  ) : super(
    color: textStyle.color?.withButtonFrameAlpha,
    elevation: 0,
    hoverElevation: 0,
    focusElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    hoverColor: textStyle.color?.withInkEffectAlpha,
    splashColor: textStyle.color?.withInkEffectAlpha,
    highlightColor: textStyle.color?.withInkEffectAlpha,
    shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
    child: Padding(
      padding: const AppEdgeInsets.small(),
      child: AppIconText(icon: icon, text: text, textStyle: textStyle)
    )
  );
}