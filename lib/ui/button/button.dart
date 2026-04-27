import 'package:flutter/material.dart';

import '../const.dart';
import '../container/container.dart';
import '../theme.dart';

class AppButton extends StatelessWidget {
  static const double _containerSize = 36;
  static const double _iconSize = 24;
  static final Color effectsColor = AppTheme.lowLightColor.withValues(alpha: 0.32);

  final bool isSelected;
  final Color color;
  final Widget child;
  final Function() onPressed;

  AppButton.label(this.isSelected, String label, this.onPressed)
    : color = AppTheme.lightBlue,
      child = Text(
        label,
        style: isSelected ? AppTheme.lightBlueBoldStyle : AppTheme.lightBlueStyle
      );

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


class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color effectsColor;
  final void Function() onPressed;
  final void Function(bool)? onHover;
  final Widget child;

  AppInkResponse({
    this.padding,
    required this.effectsColor,
    required this.onPressed,
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
      mouseCursor: SystemMouseCursors.click,
      onTap: onPressed,
      onHover: onHover,
      child: newChild
    );
  }
}