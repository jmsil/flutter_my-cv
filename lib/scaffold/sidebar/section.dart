import 'package:flutter/material.dart';

import '../../ui/container/container.dart';
import '../../ui/container/header_expandable.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/theme.dart';

class Section extends AppContainer {
  Section(bool startOpen, String title, Widget contentWidget)
    : super(
        color: Colors.black26,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: const AppEdgeInsets.normal(left: AppEdgeInsets.largeValue),
          expandableContentPadding: const AppEdgeInsets.large(top: AppEdgeInsets.smallValue),
          headerContent: Text(title, style: AppTheme.largeLightBlueBoldStyle),
          expandableContent: contentWidget
        )
      );
}