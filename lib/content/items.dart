import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class ItemsGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  ItemsGroup.languages()
    : this.icon = AppIcons.language,
      this.title = AppStrings.languagesTitle,
      this.info = AppStrings.languagesInfo;

  ItemsGroup.availability()
    : this.icon = AppIcons.availability,
      this.title = AppStrings.availabilityTitle,
      this.info = AppStrings.availabilityInfo;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: AppTheme.darkStyle
      );
      children.add(item);
      children.add(AppTheme.smallVerticalSpacing);
    }

    children.removeLast();

    return SliverContentGroup(
      icon: icon,
      title: title,
      hasHorizontalPadding: true,
      children: children
    );
  }
}