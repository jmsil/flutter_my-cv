import 'package:flutter/material.dart';

import '../content/appbar.dart';
import '../content/content.dart';
import '../content/sidebar.dart';
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            MobileAppbar(openDrawer),
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