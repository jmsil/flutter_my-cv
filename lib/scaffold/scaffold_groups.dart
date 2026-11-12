import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/list.dart';
import '../content/professional_dev.dart';
import '../ui/scroller.dart';
import 'appbar/appbar_compact.dart';

class AppScaffoldGroupsView extends AppCustomScrollView {
  AppScaffoldGroupsView(
    GlobalKey<DrawerControllerState>? drawerKey
  ) : super([
    if (drawerKey != null)
      AppbarCompact(drawerKey),

    ExperienceGroup(),
    EducationGroup(),
    ProfessionalDevelopmentGroup(),
    ListGroup.languages(),
    ListGroup.availability()
  ]);
}