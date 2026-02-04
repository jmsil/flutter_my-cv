import 'package:flutter/material.dart';

import '../content/content.dart';
import '../content/sidebar.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';

class MobileScaffold extends StatelessWidget {
  static final GlobalKey<DrawerControllerState> _drawerKey = GlobalKey();

  final bool isPortrait;
  final Function() onPressedPt;
  final Function() onPressedEn;

  MobileScaffold(this.isPortrait, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final Widget drawerButton = AppButton.icon(
      AppIcons.menu,
      () => _drawerKey.currentState?.open()
    );

    final Widget infosWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('João Marques da Silva', style: AppTheme.largeLightStyle),
        AppUiConst.vsep4,
        Text(AppStrings.role, style: AppTheme.normalLowLightStyle)
      ]
    );

    if (isPortrait) {
      return Stack(
        children: [
          Column(
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
          ),
          SafeArea(
            child: Column(
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      children: [
                        drawerButton,
                        AppUiConst.hsep8,
                        Expanded(
                          child: infosWidget
                        )
                      ]
                    )
                  )
                ),
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

    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppContainer(
              color: AppTheme.highDarkColor,
              padding: const EdgeInsets.all(8),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: -45,
                        child: infosWidget
                      )
                    ),
                    AppUiConst.vsep8,
                    drawerButton
                  ]
                )
              )
            ),
            Expanded(
              child: AppContent(false, false)
            )
          ]
        ),
        AppSidebar(_drawerKey, onPressedPt, onPressedEn)
      ]
    );
  }
}