import 'package:flutter/material.dart';

import '../../ui/container.dart';
import '../../ui/expandable/expandable_header.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';

class Section extends StatelessWidget {
  final bool startOpen;
  final String title;
  final Widget child;

  Section({
    required this.startOpen,
    required this.title,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.sidebar;
    return AppContainer(
      color: themeData.surfaceColor2,
      borderRadius: AppTheme.allBorderRadius,
      enableClip: true,
      child: AppExpandableHeader(
        startOpen: startOpen,
        arrowColor: themeData.accent1.color,
        effectColor: themeData.over2.effectColor,
        headerPadding: const AppEdgeInsets.normal(left: AppDimens.large),
        expandablePadding: const AppEdgeInsets.large(top: AppDimens.small),
        headerChild: Text(title, style: themeData.overStyled2.normalHeader.bold),
        expandableChild: child
      )
    );
  }
}