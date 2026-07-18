import 'package:flutter/material.dart';

import '../layout/edge_insets.dart';
import '../layout/layout.dart';
import '../layout/layout_provider.dart';
import '../theme/icons.dart';
import 'button.dart';

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