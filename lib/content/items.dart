import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class ItemsGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  ItemsGroup({
    required this.icon,
    required this.title,
    required this.info
  });

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

    return ContentGroup(
      icon: icon,
      title: title,
      withPadding: true,
      scrollable: false,
      children: children
    );
  }
}