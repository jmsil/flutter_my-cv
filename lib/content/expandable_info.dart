import 'package:flutter/material.dart';

import '../ui/container/container.dart';
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
        headerContentPadding: _padding,
        fixedContentPadding: _padding,
        expandableContentPadding: _padding,
        headerContent: Row(
          spacing: AppTheme.smallSpacingValue,
          children: [
            AppContainer(
              width: 8,
              height: 48,
              color: AppTheme.highDarkColor.withValues(alpha: 0.32),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)
              ),
              child: SizedBox()
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.darkBoldStyle),
                Text(subtitle, style: AppTheme.darkItalicStyle)
              ]
            )
          ]
        ),
        fixedContent: fixedContent,
        expandableContent: Text(info, style: AppTheme.darkStyle)
      );
}