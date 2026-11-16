import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text/icon_text.dart';
import '../../ui/wrap.dart';
import 'section.dart';

class SectionSkills extends StatelessWidget {
  final String title;
  final bool enableWrapping;
  final bool startOpen;
  final List<String> skills;

  SectionSkills.programming(
    {required this.startOpen}
  ) :
    this.title = StringsModel.strings.programmingSkillsTitle,
    this.enableWrapping = true,
    this.skills = Strings.programmingSkillsInfo;

  SectionSkills.integration(
    {required this.startOpen}
  ) :
    this.title = StringsModel.strings.integrationSkillsTitle,
    this.enableWrapping = false,
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
      startOpen: startOpen,
      title: title,
      child: enableWrapping
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