import 'dart:async';

import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/list.dart';
import '../content/professional_dev.dart';
import '../ui/scroller.dart';
import 'appbar/compact_appbar.dart';
import 'sidebar/sidebar.dart';

class CompactScaffold extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CompactScaffold> {
  final GlobalKey<DrawerControllerState> drawerKey = GlobalKey();
  Timer? drawerTimer;

  @override
  void initState() {
    super.initState();
    drawerTimer = Timer(const Duration(milliseconds: 500), openDrawer);
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
        AppCustomScrollView(
          [
            CompactAppbar(openDrawer),
            ExperienceGroup(),
            EducationGroup(),
            ProfessionalDevelopmentGroup(),
            ListGroup.languages(),
            ListGroup.availability()
          ]
        ),
        DrawerController(
          key: drawerKey,
          alignment: DrawerAlignment.start,
          child: AppSidebar()
        )
      ]
    );
  }

  void openDrawer() {
    drawerKey.currentState?.open();
  }
}