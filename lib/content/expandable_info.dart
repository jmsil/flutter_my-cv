import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/header_expandable.dart';
import '../ui/theme.dart';

class ExpandableInfo extends AppHeaderExpandable {
  static const EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: ThemedEdgeInsets.normalValue, vertical: ThemedEdgeInsets.smallValue
  );

  ExpandableInfo({
    required String title,
    required String subtitle,
    Widget? fixedContent,
    required String info,
    bool startOpen = false
  })
    : super(
        startOpen: startOpen,
        arrowColor: AppTheme.darkBlue,
        headerHasIntrinsic: true,
        headerContentPadding: _padding,
        fixedContentPadding: _padding,
        expandableContentPadding: _padding,
        headerContent: Row(
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
                  Text(title, style: AppTheme.darkBoldStyle),
                  Text(subtitle, style: AppTheme.darkItalicStyle)
                ]
              )
            )
          ]
        ),
        fixedContent: fixedContent,
        expandableContent: Text(info, style: AppTheme.darkStyle)
      );
}