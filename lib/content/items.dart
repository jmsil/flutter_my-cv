import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/layout/layout.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class ItemsGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  ItemsGroup.languages()
    : this.icon = AppIcons.language,
      this.title = StringsProvider.strings.languagesTitle,
      this.info = StringsProvider.strings.languagesInfo;

  ItemsGroup.availability()
    : this.icon = AppIcons.availability,
      this.title = StringsProvider.strings.availabilityTitle,
      this.info = StringsProvider.strings.availabilityInfo;

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
      children.add(AppLayout.smallVerticalSpacer);
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