import 'package:material_ui/material_ui.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/list.dart';
import '../content/professional_dev.dart';
import '../ui/scroller.dart';

class AppScaffoldGroupsView extends AppCustomScrollView {
  AppScaffoldGroupsView(
    Widget? appbar
  ) : super([
    if (appbar != null)
      appbar,

    ExperienceGroup(),
    EducationGroup(),
    ProfessionalDevelopmentGroup(),
    ListGroup.languages(),
    ListGroup.availability()
  ]);
}