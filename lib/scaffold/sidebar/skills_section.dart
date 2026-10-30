import 'package:flutter/material.dart';

import '../../ui/container/wrap.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text.dart';
import 'section.dart';

class SkillsSection extends StatelessWidget {
  final String title;
  final bool allowWrapping;
  final List<String> skills;

  SkillsSection.programming() :
    this.title = StringsModel.strings.programmingSkillsTitle,
    this.allowWrapping = true,
    this.skills = Strings.programmingSkillsInfo;

  SkillsSection.integration() :
    this.title = StringsModel.strings.integrationSkillsTitle,
    this.allowWrapping = false,
    this.skills = Strings.integrationSkillsInfo;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [];

    for (String item in skills) {
      children.add(AppIconText.bullet(
        text: item,
        textStyle: theme.sidebarSection.normalText.over1.regular
      ));
    }

    return Section(
      theme: theme,
      startOpen: false,
      title: title,
      contentWidget: allowWrapping
        ? AppWrap(
            width: 270,
            spacing: AppLayout.xLargeSpacing,
            runSpacing: AppLayout.smallSpacing,
            children: children
          )
      : Column(
          spacing: AppLayout.smallSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
        )
    );
  }
}