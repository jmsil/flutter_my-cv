import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text.dart';
import '../../ui/wrap.dart';
import 'section.dart';

class SectionSkills extends StatelessWidget {
  final String title;
  final bool allowWrapping;
  final List<String> skills;

  SectionSkills.programming() :
    this.title = StringsModel.strings.programmingSkillsTitle,
    this.allowWrapping = true,
    this.skills = Strings.programmingSkillsInfo;

  SectionSkills.integration() :
    this.title = StringsModel.strings.integrationSkillsTitle,
    this.allowWrapping = false,
    this.skills = Strings.integrationSkillsInfo;

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.sidebar;
    final List<Widget> children = [];

    for (String item in skills) {
      children.add(AppIconText.bullet(
        text: item,
        textStyle: themeData.overStyled1.normalText.regular
      ));
    }

    return Section(
      startOpen: false,
      title: title,
      child: allowWrapping
        ? AppWrap(
            width: 270,
            spacing: AppDimens.xLarge,
            runSpacing: AppDimens.small,
            children: children
          )
      : Column(
          spacing: AppDimens.small,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
        )
    );
  }
}