import 'package:flutter/material.dart';

import '../content/content.dart';
import '../content/sidebar.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';

class MobileScaffold extends StatelessWidget {
  static final GlobalKey<DrawerControllerState> _drawerKey = GlobalKey();

  final Function() onPressedPt;
  final Function() onPressedEn;

  MobileScaffold(this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final Widget background = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: AppTheme.highDarkColor,
          child: SafeArea(
            bottom: false,
            child: const SizedBox(height: 144)
          )
        ),
        Expanded(
          child: Material(
            color: AppTheme.midLightColor
          )
        )
      ]
    );

    final Widget headerWidget = Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AppButton.icon(AppIcons.menu, () => _drawerKey.currentState?.open()),
            AppUiConst.hsep8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('João Marques da Silva', style: AppTheme.largeLightStyle),
                  AppUiConst.vsep4,
                  Text(AppStrings.role, style: AppTheme.normalLowLightStyle)
                ]
              )
            )
          ]
        )
      )
    );

    return Stack(
      children: [
        background,
        SafeArea(
          child: Column(
            children: [
              headerWidget,
              Expanded(
                child: AppContent(false, true)
              )
            ]
          )
        ),
        AppSidebar(_drawerKey, onPressedPt, onPressedEn)
      ]
    );
  }
}