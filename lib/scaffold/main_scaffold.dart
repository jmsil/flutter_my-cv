import 'package:flutter/material.dart';

import '../ui/layout/layout_model.dart';
import 'compact_scaffold.dart';
import 'device.dart';
import 'extended_scaffold.dart';

class MainScaffold extends ListenableBuilder {
  MainScaffold() : super(
    listenable: LayoutModel.instance,
    builder: (BuildContext context, Widget? child) {
      return Material(
        color: context.appLayout.theme.background.baseColor,
        child: context.isExtendedScreen
          ? ExtendedScaffold()
          : CompactScaffold()
      );
    }
  );
}