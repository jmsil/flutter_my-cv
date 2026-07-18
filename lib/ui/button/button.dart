import 'package:flutter/material.dart';

import '../const.dart';
import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout.dart';
import '../layout/layout_provider.dart';
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

class AppInkResponse extends StatelessWidget {
  final EdgeInsets? padding;
  final Color effectsColor;
  final void Function()? onPressed;
  final void Function(bool)? onHover;
  final Widget child;

  AppInkResponse({
    this.padding,
    required this.effectsColor,
    this.onPressed,
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
      mouseCursor: onPressed == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
      onTap: onPressed ?? () {},
      onHover: onHover,
      child: newChild
    );
  }
}

class AppPopupMenuButton extends PopupMenuButton {
  AppPopupMenuButton(List<Widget> children)
    : super(
        offset: const Offset(76, -166),
        color: LayoutProvider.theme.backgroundColor,
        menuPadding: const AppEdgeInsets.small(
          top: AppEdgeInsets.largeValue,
          bottom: AppEdgeInsets.normalValue
        ),
        elevation: 8,
        shadowColor: LayoutProvider.theme.elementColor1,
        shape: RoundedRectangleBorder(
          borderRadius: LayoutProvider.theme.allBorderRadius,
          side: BorderSide(
            width: 1,
            color: LayoutProvider.theme.overBackgroundColor2.withValues(alpha: 0.36)
          )
        ),
        itemBuilder: (builderContext) {
          return [
            PopupMenuItem(
              enabled: false,
              child: IconTheme.merge(
                data: IconThemeData(opacity: 1.0),
                child: Column(
                  spacing: AppLayout.smallSpacing,
                  children: children
                )
              )
            )
          ];
        }
      );

  @override
  _AppPopupMenuButtonState createState() => _AppPopupMenuButtonState();
}

class _AppPopupMenuButtonState extends PopupMenuButtonState {
  @override
  Widget build(BuildContext context) {
    return AppButton.icon(
      icon: AppIcons.settings,
      onPressed: showButtonMenu
    );
  }
}