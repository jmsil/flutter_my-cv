import 'package:flutter/material.dart';

import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';
import 'group.dart';

class ItemsGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  ItemsGroup.languages() :
    this.icon = AppIcons.language,
    this.title = StringsModel.strings.languagesTitle,
    this.info = StringsModel.strings.languagesInfo;

  ItemsGroup.availability() :
    this.icon = AppIcons.availability,
    this.title = StringsModel.strings.availabilityTitle,
    this.info = StringsModel.strings.availabilityInfo;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: theme.background.normalText.over1.regular
      );
      children.add(item);
      children.add(AppLayout.smallVerticalSpacer);
    }

    children.removeLast();

    return ContentGroup(
      icon: icon,
      title: title,
      hasHorizontalPadding: true,
      children: children
    );
  }
}