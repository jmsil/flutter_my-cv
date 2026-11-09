import 'package:flutter/material.dart';

import '../ui/expandable/expandable_header.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/layout_theme_model.dart';

class ExpandableContent extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal(vertical: AppDimens.small);

  final String headerTitle;
  final String headerDetail;
  final Widget? widgetBeforeInfo;
  final String? info;
  final Widget? widgetAfterInfo;
  final bool startOpen;

  ExpandableContent({
    required this.headerTitle,
    required this.headerDetail,
    this.widgetBeforeInfo,
    this.info,
    this.widgetAfterInfo,
    this.startOpen = false
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutThemeModel.theme;

    final builtHeaderWidget = Row(
      spacing: AppDimens.small,
      children: [
        VerticalDivider(
          thickness: 8, width: 8,
          color: theme.background.over1.color.withDecorationAlpha,
          radius: AppTheme.circleBorderRadius
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$headerTitle\n', style: theme.background.overStyled1.normalHeader.bold),
                TextSpan(
                  text: headerDetail, style: theme.background.overStyled1.normalText.italic)
              ]
            )
          )
        )
      ]
    );

    final List<Widget> expandableChildren = [];

    if (widgetBeforeInfo != null)
      expandableChildren.add(widgetBeforeInfo!);

    if (info != null) {
      Widget widget = Text(info!, style: theme.background.overStyled1.normalText.regular);
      expandableChildren.add(widget);
    }

    if (widgetAfterInfo != null)
      expandableChildren.add(widgetAfterInfo!);

    if (expandableChildren.isEmpty) {
      Widget widget = Text('- - -', style: theme.background.overStyled1.normalText.bold);
      expandableChildren.add(widget);
    }

    final builtExpandableWidget = expandableChildren.length == 1
      ? expandableChildren[0]
      : Column(
          spacing: AppDimens.normal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: expandableChildren
        );

    return AppExpandableHeader(
      startOpen: startOpen,
      arrowColor: theme.background.decoration1.color,
      effectColor: theme.brand2.surfaceColor,
      enableClip: true,
      enableIntrinsicHeaderHeight: true,
      headerPadding: _padding,
      expandablePadding: _padding,
      headerChild: builtHeaderWidget,
      expandableChild: builtExpandableWidget
    );
  }
}