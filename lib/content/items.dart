import 'package:flutter/material.dart';

import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme/icons.dart';
import '../ui/theme/theme.dart';
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
    final AppTheme theme = context.providerTheme;
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: theme.text1OverBackgroundColor1Style
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