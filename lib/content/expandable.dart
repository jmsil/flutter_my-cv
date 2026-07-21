import 'package:flutter/material.dart';

import '../ui/container/header_expandable.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_provider.dart';

class ExpandableContent extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue);

  final String headerTitle;
  final String? headerDetail;
  final Widget? infoWidget;
  final String? infoText;
  final bool startOpen;

  ExpandableContent({
    required this.headerTitle,
    this.headerDetail,
    this.infoWidget,
    this.infoText,
    this.startOpen = false
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    Widget headerInfoWidget = Text(headerTitle, style: theme.header1OverBackgroundColor1BoldStyle);

    if (headerDetail != null) {
      headerInfoWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerInfoWidget,
          Text(headerDetail!, style: theme.text1OverBackgroundColor1ItalicStyle)
        ]
      );
    }

    final headerContentWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        VerticalDivider(
          thickness: 8, width: 8,
          color: theme.overBackgroundColor1.withValues(alpha: 0.16),
          radius: AppTheme.circleBorderRadius
        ),
        Expanded(
          child: headerInfoWidget
        )
      ]
    );

    Widget expandableContentWidget;

    final Widget? infoTextWidget = infoText != null
      ? Text(infoText!, style: theme.text1OverBackgroundColor1Style)
      : null;

    if (infoWidget != null && infoTextWidget != null) {
      expandableContentWidget = Column(
        spacing: AppLayout.normalSpacing,
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
      expandableContentWidget = Text('- - -', style: theme.text1OverBackgroundColor1BoldStyle);

    return AppHeaderExpandable(
      startOpen: startOpen,
      isClipped: true,
      headerHasIntrinsic: true,
      arrowColor: theme.overBackgroundColor2,
      headerContentPadding: _padding,
      expandableContentPadding: _padding,
      headerContent: headerContentWidget,
      expandableContent: expandableContentWidget
    );
  }
}