import 'package:flutter/material.dart';

import '../content/courses_books.dart';
import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';
import 'appbar/mobile_appbar.dart';
import 'sidebar/sidebar.dart';

class MobileScaffold extends StatefulWidget {
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
        AppSliverScroller(
          [
            MobileAppbar(openDrawer),
            ExperienceGroup.sliver(AppTheme.highDarkColor),
            EducationGroup(),
            CoursesAndBooksGroup(),
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