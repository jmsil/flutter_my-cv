import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/list.dart';
import '../content/professional_dev.dart';
import '../ui/layout/device.dart';
import '../ui/layout/layout_model.dart';
import '../ui/scroller.dart';
import 'appbar/appbar_compact.dart';
import 'scaffold_compact.dart';
import 'scaffold_extended.dart';

class AppScaffold extends ListenableBuilder {
  AppScaffold() : super(
    listenable: LayoutModel.instance,
    builder: (BuildContext context, Widget? child) {
      final bool isExtendedScreen = context.isExtendedScreen;
      LayoutModel.instance.setLayoutModeOnScaffoldBuild(isExtendedScreen);
      return Material(
        color: LayoutModel.theme.background.surfaceColor1,
        child: isExtendedScreen
          ? AppScaffoldExtended()
          : AppScaffoldCompact()
      );
    }
  );
}

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