import 'package:flutter/material.dart';

import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/layout_theme_model.dart';
import 'button.dart';

class AppPopupMenuButton extends PopupMenuButton {
  AppPopupMenuButton({
    required AppThemeData themeData,
    required double spacing,
    required List<Widget> children
  }) : super(
    color: themeData.surfaceColor,
    constraints: const BoxConstraints(maxWidth: 296),
    menuPadding: const AppEdgeInsets.small(
      top: AppDimens.large,
      bottom: AppDimens.normal
    ),
    elevation: 8,
    shadowColor: Colors.black54,
    shape: RoundedRectangleBorder(
      borderRadius: AppTheme.allBorderRadius,
      side: BorderSide(
        width: 1,
        color: themeData.accent1.color.withWindowBorderAlpha
      )
    ),
    itemBuilder: (builderContext) {
      return [
        PopupMenuItem(
          enabled: false,
          child: IconTheme.merge(
            data: IconThemeData(opacity: 1.0),
            child: Column(
              spacing: spacing,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children
            )
          )
        )
      ];
    }
  );

  @override
  _State createState() => _State();
}

class _State extends PopupMenuButtonState {
  @override
  Widget build(BuildContext context) {
    final AppLayoutMode layoutMode = LayoutThemeModel.layoutMode;
    final AppTheme theme = LayoutThemeModel.theme;
    return AppButton.icon(
      icon: AppIcons.settings,
      themeProperty: layoutMode.showSidebarBackground
        ? theme.brand1.over1
        : theme.background.over1,
      onPressed: showButtonMenu
    );
  }
}