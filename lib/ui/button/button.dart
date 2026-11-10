import 'package:flutter/material.dart';

import '../container.dart';
import '../layout/dimens.dart';
import '../layout/theme.dart';
import '../text.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;

  final AppThemeDataBasicProperty themeProperty;
  final bool isSelected;
  final bool _isProcessing;
  final Widget child;
  final void Function() onPressed;

  AppButton.label({
    required String label,
    required AppThemeDataStyledProperty themeProperty,
    required this.isSelected,
    required this.onPressed
  }) :
    this._isProcessing = false,
    this.themeProperty = themeProperty,
    this.child = Text(
      label,
      style: isSelected ? themeProperty.normalText.bold : themeProperty.normalText.regular
    );

  AppButton.icon({
    required IconData icon,
    required this.themeProperty,
    bool isProcessing = false,
    this.isSelected = false,
    required this.onPressed
  }) :
    this._isProcessing = isProcessing,
    this.child = Icon(icon, size: _iconSize, color: themeProperty.color);

  @override
  Widget build(BuildContext context) {
    final Color inkEffectColor = themeProperty.effectColor.withInkEffectAlpha;

    final builtChild = _isProcessing
      ? SizedBox(
          width: _iconSize,
          height: _iconSize,
          child: CircularProgressIndicator(
            color: themeProperty.color,
            strokeWidth: 3,
            backgroundColor: themeProperty.color.withValues(alpha: 0.26)
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
        color: isSelected ? themeProperty.color.withButtonFrameAlpha : null,
        borderRadius: AppTheme.circleBorderRadius,
        child: Center(child: builtChild)
      ),
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed
    );
  }
}

class AppMaterialButton extends MaterialButton {
  AppMaterialButton({
    required IconData icon,
    required String text,
    required AppThemeDataStyledProperty themeProperty,
    super.onPressed
  }) : super(
    minWidth: double.infinity,
    height: 48,
    color: themeProperty.color.withButtonFrameAlpha,
    padding: const EdgeInsets.symmetric(horizontal: AppDimens.xxLarge),
    elevation: 0,
    hoverElevation: 0,
    focusElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    hoverColor: themeProperty.effectColor.withInkEffectAlpha,
    splashColor: themeProperty.effectColor.withInkEffectAlpha,
    highlightColor: themeProperty.effectColor.withInkEffectAlpha,
    shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
    child: AppIconText(icon: icon, text: text, textStyle: themeProperty.normalText.bold)
  );
}