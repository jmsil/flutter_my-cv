import 'package:flutter/material.dart';

import '../../ui/container/container.dart';
import '../../ui/container/header_expandable.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/theme.dart';

class Section extends AppContainer {
  Section({
    required AppTheme theme,
    required bool startOpen,
    required String title,
    required Widget contentWidget
  }) : super(
    color: theme.sidebarSection.baseColor,
    borderRadius: AppTheme.allBorderRadius,
    isClipped: true,
    child: AppHeaderExpandable(
      startOpen: startOpen,
      arrowColor: theme.sidebarSection.decorationColor,
      effectColor: theme.sidebarSection.baseColor,
      headerPadding: const AppEdgeInsets.normal(left: AppEdgeInsets.largeValue),
      expandablePadding: const AppEdgeInsets.large(top: AppEdgeInsets.smallValue),
      headerChild: Text(title, style: theme.sidebarSection.normalHeader.over2.bold),
      expandableChild: contentWidget
    )
  );
}