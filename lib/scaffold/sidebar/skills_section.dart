import 'package:flutter/material.dart';

import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/text.dart';
import '../../ui/theme/icons.dart';
import 'section.dart';

class SkillsSection extends StatelessWidget {
  final String title;
  final String info;

  SkillsSection(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: LayoutProvider.theme.text1OverSectionColor1Style
      );
      children.add(item);
    }

    return Section(
      false,
      title,
      Column(
        spacing: AppLayout.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}