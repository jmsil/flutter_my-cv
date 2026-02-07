import 'package:flutter/material.dart';

import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/theme.dart';

class ExpandableInfo extends AppHeaderExpandable {
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
        headerContentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        fixedContentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        expandableContentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        headerContent: Row(
          spacing: 8,
          children: [
            AppContainer(
              width: 8,
              height: 48,
              color: AppTheme.darkBlue.withValues(alpha: 0.36),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)
              ),
              child: SizedBox()
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.darkBlueBoldStyle),
                Text(subtitle, style: AppTheme.darkBlueItalicStyle)
              ]
            )
          ]
        ),
        fixedContent: fixedContent,
        expandableContent: Text(info, style: AppTheme.darkStyle)
      );
}