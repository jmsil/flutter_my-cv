import 'package:flutter/material.dart';

import '../ui/layout/device.dart';
import '../ui/layout/layout_model.dart';
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