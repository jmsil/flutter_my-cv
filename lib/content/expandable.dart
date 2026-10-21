import 'package:flutter/material.dart';

import '../ui/container/header_expandable.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_model.dart';

class ExpandableContent extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue);

  final String headerTitle;
  final String? headerDetail;
  final Widget? widgetBeforeInfo;
  final String? info;
  final Widget? widgetAfterInfo;
  final bool startOpen;

  ExpandableContent({
    required this.headerTitle,
    this.headerDetail,
    this.widgetBeforeInfo,
    this.info,
    this.widgetAfterInfo,
    this.startOpen = false
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    Widget builtHeaderWidget = Text(
      headerTitle, style: theme.background.normalHeader.over1.bold);

    if (headerDetail != null) {
      builtHeaderWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          builtHeaderWidget,
          Text(headerDetail!, style: theme.background.normalText.over1.italic)
        ]
      );
    }

    builtHeaderWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        VerticalDivider(
          thickness: 8, width: 8,
          color: theme.background.overColor1.withDecorationAlpha,
          radius: AppTheme.circleBorderRadius
        ),
        Expanded(
          child: builtHeaderWidget
        )
      ]
    );

    final List<Widget> expandableChildren = [];

    if (widgetBeforeInfo != null)
      expandableChildren.add(widgetBeforeInfo!);

    if (info != null) {
      Widget widget = Text(info!, style: theme.background.normalText.over1.regular);
      expandableChildren.add(widget);
    }

    if (widgetAfterInfo != null)
      expandableChildren.add(widgetAfterInfo!);

    if (expandableChildren.isEmpty) {
      Widget widget = Text('- - -', style: theme.background.normalText.over1.bold);
      expandableChildren.add(widget);
    }

    final builtExpandableWidget = expandableChildren.length == 1
      ? expandableChildren[0]
      : Column(
          spacing: AppLayout.normalSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: expandableChildren
        );

    return AppHeaderExpandable(
      startOpen: startOpen,
      arrowColor: theme.background.decorationColor,
      effectColor: theme.brand2.baseColor,
      isClipped: true,
      isIntrinsicHeader: true,
      headerPadding: _padding,
      expandablePadding: _padding,
      headerChild: builtHeaderWidget,
      expandableChild: builtExpandableWidget
    );
  }
}