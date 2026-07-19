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
  })
    : super(
        color: theme.sectionColor,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: theme.overSectionColor3,
          headerContentPadding: const AppEdgeInsets.normal(left: AppEdgeInsets.largeValue),
          expandableContentPadding: const AppEdgeInsets.large(top: AppEdgeInsets.smallValue),
          headerContent: Text(title, style: theme.header1OverSectionColor2BoldStyle),
          expandableContent: contentWidget
        )
      );
}