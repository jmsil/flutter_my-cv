import 'package:flutter/material.dart';

import '../content/content.dart';
import '../content/sidebar.dart';
import '../ui/button.dart';
import '../ui/const.dart';
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
            AppButton.icon(AppIcons.menu, openDrawer),
            AppUiConst.hsep8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('João Marques da Silva', style: AppTheme.lightStyle),
                  AppUiConst.vsep4,
                  Text(AppStrings.role, style: AppTheme.lowLightStyle)
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
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          scrimColor: Colors.black26,
          child: AppSidebar(widget.onPressedPt, widget.onPressedEn)
        )
      ]
    );
  }

  void openDrawer() {
    drawerKey.currentState?.open();
  }
}