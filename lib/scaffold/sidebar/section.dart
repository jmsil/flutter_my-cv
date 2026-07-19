import 'package:flutter/material.dart';

import '../../ui/container/container.dart';
import '../../ui/container/header_expandable.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_provider.dart';

class Section extends AppContainer {
  Section(bool startOpen, String title, Widget contentWidget)
    : super(
        color: LayoutProvider.theme.sectionColor,
        borderRadius: LayoutProvider.theme.allBorderRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: LayoutProvider.theme.overSectionColor2,
          headerContentPadding: const AppEdgeInsets.normal(left: AppEdgeInsets.largeValue),
          expandableContentPadding: const AppEdgeInsets.large(top: AppEdgeInsets.smallValue),
          headerContent: Text(
            title, style: LayoutProvider.theme.header1OverSectionColor2BoldStyle),
          expandableContent: contentWidget
        )
      );
}