import 'package:material_ui/material_ui.dart';

import '../container.dart';
import '../layout/dimens.dart';
import '../layout/theme.dart';
import '../text/icon_text.dart';

class AppIconButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;

  final AppThemeDataBasicProperty themeProperty;
  final bool isSelected;
  final bool _isProcessing;
  final Widget child;
  final void Function() onPressed;

  AppIconButton({
    required IconData icon,
    required this.themeProperty,
    bool isProcessing = false,
    this.isSelected = false,
    required this.onPressed
  }) :
    this._isProcessing = isProcessing,
    this.child = Icon(icon, size: _iconSize, color: themeProperty.color);

  AppIconButton.label({
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
            backgroundColor: themeProperty.color.withMidDecorationAlpha
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
        color: isSelected ? themeProperty.color.withDecorationAlpha : null,
        borderRadius: AppTheme.circleBorderRadius,
        child: Center(child: builtChild)
      ),
      mouseCursor: SystemMouseCursors.click,
      onPressed: onPressed
    );
  }
}

class AppButton extends MaterialButton {
  AppButton({
    required IconData icon,
    String? text,
    required AppThemeDataStyledProperty themeProperty,
    bool expands = false,
    super.onPressed
  }) : super(
    minWidth: expands ? double.infinity : 0,
    height: 48,
    color: text == null ? Colors.transparent : themeProperty.color.withDecorationAlpha,
    padding: EdgeInsets.symmetric(horizontal: text == null ? AppDimens.large : AppDimens.xLarge),
    elevation: 0,
    hoverElevation: 0,
    focusElevation: 0,
    disabledElevation: 0,
    highlightElevation: 0,
    hoverColor: themeProperty.effectColor.withInkEffectAlpha,
    splashColor: themeProperty.effectColor.withInkEffectAlpha,
    highlightColor: themeProperty.effectColor.withInkEffectAlpha,
    shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
    child: text == null
      ? Icon(icon, color: themeProperty.color)
      : AppIconText(
          icon: icon,
          text: text,
          textStyle: themeProperty.normalText.bold,
          enableOverflow: true
        )
  );
}