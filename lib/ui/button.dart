import 'package:flutter/material.dart';

import 'container/container.dart';
import 'theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static Color _effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

  final bool isSelected;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isSelected, String label, this.onPressed)
    :
    child = Text(
      label,
      style: isSelected ? AppTheme.lightBlueStyle : AppTheme.highLightStyle
    );

  AppButton.icon(IconData icon, this.onPressed)
    :
    isSelected = false,
    child = Icon(icon, size: 24, color: AppTheme.highLightColor);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: _containerSize,
      splashColor: _effectsColor,
      hoverColor: _effectsColor,
      highlightColor: _effectsColor,
      icon: AppContainer(
        width: _containerSize,
        height: _containerSize,
        borderSize: 2,
        borderColor: isSelected ? AppTheme.lightBlue : AppTheme.highLightColor,
        borderRadius: BorderRadius.circular(_containerSize),
        child: Center(
          child: child
        )
      ),
      mouseCursor: SystemMouseCursors.basic,
      onPressed: onPressed
    );
  }
}


class AppImageSlider extends AppContainer {
  static const double _padding = 12;
  static const double _width = 120;
  static const double _height = (_width - _padding * 2) / 3 * 2 + _padding * 2;

  AppImageSlider(Function()? onPressed)
    : super(
        width: _width,
        height: _height,
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.appThemeRadius,
        isClipped: true,
        child: InkResponse(
          focusColor: Colors.transparent,
          hoverColor: AppButton._effectsColor,
          splashColor: AppButton._effectsColor,
          highlightColor: AppButton._effectsColor,
          highlightShape: BoxShape.rectangle,
          splashFactory: InkRipple.splashFactory,
          mouseCursor: SystemMouseCursors.basic,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Image.asset('assets/image_slider.png', fit: BoxFit.fill)
          )
        )
      );
}