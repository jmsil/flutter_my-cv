import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class ItemsGroup extends ContentGroup {
  ItemsGroup(IconData icon, String title, String item1, String item2)
    : super(
        icon: icon,
        title: title,
        withPadding: true,
        scrollable: false,
        children: [
          AppIconText(AppIcons.arrow_right, item1, false),
          AppTheme.smallVerticalSpacing,
          AppIconText(AppIcons.arrow_right, item2, false)
        ]
      );
}