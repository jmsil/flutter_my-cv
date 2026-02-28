import 'package:flutter/material.dart';

import '../content/content.dart';
import '../content/sidebar.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';

class MobileScaffold extends StatefulWidget {
  final Function() onPressedPt;
  final Function() onPressedEn;

  MobileScaffold(this.onPressedPt, this.onPressedEn);

  @override
  _State createState() => _State();
}

class _State extends State<MobileScaffold> {
  static final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), openDrawer);
  }

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = AppContainer(
      color: AppTheme.highDarkColor,
      padding: const EdgeInsets.all(16),
      child: Row(
        spacing: 8,
        children: [
          AppButton.icon(AppIcons.menu, openDrawer),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('João Marques da Silva', style: AppTheme.highLightStyle),
                Text(AppStrings.role, style: AppTheme.lowLightStyle)
              ]
            )
          )
        ]
      )
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            headerWidget,
            Expanded(
              child: AppContent(true, false)
            )
          ]
        ),
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          scrimColor: AppTheme.navigatorBackgroundColor,
          child: AppSidebar(true, widget.onPressedPt, widget.onPressedEn)
        )
      ]
    );
  }

  void openDrawer() {
    drawerKey.currentState?.open();
  }
}