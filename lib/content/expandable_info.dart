import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/header_expandable.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/theme.dart';

class ExpandableInfo extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue);

  final String headerTitle;
  final String? headerDetail;
  final Widget? infoWidget;
  final String? infoText;
  final bool startOpen;

  ExpandableInfo({
    required this.headerTitle,
    this.headerDetail,
    this.infoWidget,
    this.infoText,
    this.startOpen = false
  });

  @override
  Widget build(BuildContext context) {
    Widget headerInfoWidget = Text(headerTitle, style: AppTheme.largeDarkBoldStyle);

    if (headerDetail != null) {
      headerInfoWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerInfoWidget,
          Text(headerDetail!, style: AppTheme.darkItalicStyle)
        ]
      );
    }

    final headerContentWidget = Row(
      spacing: AppTheme.smallSpacingValue,
      children: [
        VerticalDivider(
          thickness: 8, width: 8,
          color: AppTheme.highDarkColor.withValues(alpha: 0.32),
          radius: AppUiConst.circleBorderRadius
        ),
        Expanded(
          child: headerInfoWidget
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