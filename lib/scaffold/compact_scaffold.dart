import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../content/professional_development.dart';
import '../ui/scroller.dart';
import 'appbar/compact_appbar.dart';
import 'sidebar/sidebar.dart';

class CompactScaffold extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CompactScaffold> {
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
        AppSliverScroller(
          [
            CompactAppbar(openDrawer),
            ExperienceGroup(),
            EducationGroup(),
            ProfessionalDevelopmentGroup(),
            ItemsGroup.languages(),
            ItemsGroup.availability()
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