import 'package:flutter/material.dart';

import '../layout/dimens.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import 'button.dart';

class AppPopupMenuButton extends PopupMenuButton {
  AppPopupMenuButton({
    required AppTheme theme,
    required List<Widget> children
  }) : super(
    offset: const Offset(76, -238),
    color: theme.background.baseColor,
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
        color: theme.background.decorationColor.withWindowBorderAlpha
      )
    ),
    itemBuilder: (builderContext) {
      return [
        PopupMenuItem(
          enabled: false,
          child: IconTheme.merge(
            data: IconThemeData(opacity: 1.0),
            child: Column(
              spacing: AppDimens.small,
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
    final AppLayout layout = context.appLayout;
    return AppButton.icon(
      icon: AppIcons.settings,
      color: layout.showSidebarBackground
        ? layout.theme.brand1.overColor1
        : layout.theme.background.overColor1,
      onPressed: showButtonMenu
    );
  }
}