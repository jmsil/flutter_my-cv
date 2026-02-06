import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'group.dart';

class ProfessionalExperienceGroup extends StatelessWidget {
  final bool hasListView;
  final List<Widget> _children = [];

  ProfessionalExperienceGroup(this.hasListView);

  @override
  Widget build(BuildContext context) {
    _addChild(
      AppStrings.fortlevExperienceTitle, AppStrings.fortlevExperiencePeriod,
      Wrap(
        direction: Axis.horizontal,
        spacing: 36,
        children: [
          AppIconText(AppIcons.link, 'https://www.bci-consulting.com', false, true),
          AppIconText(AppIcons.link, 'https://www.fortlev.com.br', false, true)
        ]
      ),
      AppStrings.fortlevExperienceText, true, true
    );

    _addChild(
      AppStrings.flutterExperienceTitle, '2021', null,
      AppStrings.flutterExperienceText, true, false
    );

    _addChild(
      AppStrings.mobileGameExperienceTitle, '2013 - 2020', null,
      AppStrings.mobileGameExperienceText, true, false
    );

    _addChild(
      AppStrings.santriExperienceTitle, AppStrings.santriExperiencePeriod,
      AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
      AppStrings.santriExperienceText, true, false
    );

    _addChild(
      AppStrings.smallERPTitle, '2006/2007', null,
      AppStrings.smallERPText, false, false
    );

    return ContentGroup(
      icon: AppIcons.experience,
      title: AppStrings.professionalExperienceTitle,
      hasPadding: false,
      hasListView: hasListView,
      children: _children
    );
  }

  void _addChild(
      String title,
      String period,
      Widget? fixedContent,
      String expandableContent,
      bool addSeparator,
      bool startOpen
    )
  {
    final Widget child = AppHeaderExpandable(
      startOpen: startOpen,
      arrowColor: AppTheme.darkBlue,
      headerContentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      fixedContentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      expandableContentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      headerContent: Row(
        children: [
          AppContainer(
            width: 8,
            height: 48,
            color: AppTheme.darkBlue.withValues(alpha: 0.36),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)
            ),
            child: SizedBox()
          ),
          AppUiConst.hsep8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTheme.darkBlueBoldStyle),
              Text(period, style: AppTheme.darkBlueItalicStyle)
            ]
          )
        ]
      ),
      fixedContent: fixedContent,
      expandableContent: Text(expandableContent, style: AppTheme.darkStyle)
    );
    _children.add(child);

    if (addSeparator)
      _children.add(AppUiConst.vsep16);
  }
}