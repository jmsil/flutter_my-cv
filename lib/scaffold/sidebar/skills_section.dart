import 'package:flutter/material.dart';

import '../../ui/layout/icons.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/layout/theme.dart';
import '../../ui/text.dart';
import 'section.dart';

class SkillsSection extends StatelessWidget {
  final String title;
  final String info;

  SkillsSection(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: theme.text1OverSectionColor1Style
      );
      children.add(item);
    }

    return Section(
      theme: theme,
      startOpen: false,
      title: title,
      contentWidget: Column(
        spacing: AppLayout.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}