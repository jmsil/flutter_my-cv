import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/list.dart';
import '../content/professional_dev.dart';
import '../ui/layout/layout_theme_model.dart';
import '../ui/scroller.dart';
import 'appbar/compact_appbar.dart';
import 'compact_scaffold.dart';
import 'device.dart';
import 'extended_scaffold.dart';

class AppScaffold extends ListenableBuilder {
  AppScaffold() : super(
    listenable: LayoutThemeModel.instance,
    builder: (BuildContext context, Widget? child) {
      final bool isExtendedScreen = context.isExtendedScreen;
      LayoutThemeModel.instance.setLayoutModeOnScaffoldBuild(isExtendedScreen);

      return Material(
        color: LayoutThemeModel.theme.background.surfaceColor1,
        child: isExtendedScreen
          ? ExtendedScaffold()
          : CompactScaffold()
      );
    }
  );
}

class AppScaffoldGroupsView extends AppCustomScrollView {
  AppScaffoldGroupsView(
    GlobalKey<DrawerControllerState>? drawerKey
  ) : super([
    if (drawerKey != null)
      CompactAppbar(drawerKey),

    ExperienceGroup(),
    EducationGroup(),
    ProfessionalDevelopmentGroup(),
    ListGroup.languages(),
    ListGroup.availability()
  ]);
}