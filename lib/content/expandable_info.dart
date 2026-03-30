import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/header_expandable.dart';
import '../ui/theme.dart';

class ExpandableInfo extends StatelessWidget {
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: ThemedEdgeInsets.normalValue, vertical: ThemedEdgeInsets.smallValue
  );

  final String headerTitle;
  final String headerDetail;
  final Widget? infoWidget;
  final String? infoText;
  final bool startOpen;

  ExpandableInfo({
    required this.headerTitle,
    required this.headerDetail,
    this.infoWidget,
    this.infoText,
    this.startOpen = false
  });

  @override
  Widget build(BuildContext context) {
    final headerContentWidget = Row(
      spacing: AppTheme.smallSpacingValue,
      children: [
        VerticalDivider(
          thickness: 8, width: 8,
          color: AppTheme.highDarkColor.withValues(alpha: 0.32),
          radius: AppUiConst.circleBorderRadius
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headerTitle, style: AppTheme.darkBoldStyle),
              Text(headerDetail, style: AppTheme.darkItalicStyle)
            ]
          )
        )
      ]
    );

    Widget expandableContentWidget;

    final Widget? infoTextWidget = infoText != null
      ? Text(infoText!, style: AppTheme.darkStyle)
      : null;

    if (infoWidget != null && infoTextWidget != null) {
      expandableContentWidget = Column(
        spacing: AppTheme.normalSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoWidget!,
          infoTextWidget
        ]
      );
    }
    else if (infoWidget != null)
      expandableContentWidget = infoWidget!;
    else if (infoTextWidget != null)
      expandableContentWidget = infoTextWidget;
    else
      expandableContentWidget = Text('- - -', style: AppTheme.darkBoldStyle);

    return AppHeaderExpandable(
      startOpen: startOpen,
      isClipped: true,
      headerHasIntrinsic: true,
      arrowColor: AppTheme.darkBlue,
      headerContentPadding: _padding,
      expandableContentPadding: _padding,
      headerContent: headerContentWidget,
      expandableContent: expandableContentWidget
    );
  }
}