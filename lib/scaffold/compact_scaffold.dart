import 'dart:async';

import 'package:flutter/material.dart';

import 'scaffold.dart';
import 'sidebar/sidebar.dart';

class CompactScaffold extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CompactScaffold> {
  Timer? drawerTimer;
  final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    drawerTimer = Timer(
      const Duration(milliseconds: 500),
      () => drawerKey.currentState?.open()
    );
  }

  @override
  void dispose() {
    drawerTimer?.cancel();
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppScaffoldGroupsView(drawerKey),
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          child: AppSidebar()
        )
      ]
    );
  }
}