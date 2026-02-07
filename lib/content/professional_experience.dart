import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import 'expandable_info.dart';
import 'group.dart';

class ProfessionalExperienceGroup extends StatelessWidget {
  final bool scrollable;

  ProfessionalExperienceGroup(this.scrollable);

  @override
  Widget build(BuildContext context) {
    return ContentGroup(
      icon: AppIcons.experience,
      title: AppStrings.professionalExperienceTitle,
      hasPadding: false,
      scrollable: scrollable,
      children: [
        ExpandableInfo(
          title: AppStrings.fortlevExperienceTitle,
          subtitle: AppStrings.fortlevExperiencePeriod,
          fixedContent: Wrap(
            direction: Axis.horizontal,
            spacing: 36,
            children: [
              AppIconText(AppIcons.link, 'https://www.bci-consulting.com', false, true),
              AppIconText(AppIcons.link, 'https://www.fortlev.com.br', false, true)
            ]
          ),
          info: AppStrings.fortlevExperienceText,
          startOpen: true
        ),
        AppUiConst.vsep16,

        ExpandableInfo(
          title: AppStrings.flutterExperienceTitle,
          subtitle: '2021',
          info: AppStrings.flutterExperienceText
        ),
        AppUiConst.vsep16,

        ExpandableInfo(
          title: AppStrings.mobileGameExperienceTitle,
          subtitle: '2013 - 2020',
          info: AppStrings.mobileGameExperienceText
        ),
        AppUiConst.vsep16,

        ExpandableInfo(
          title: AppStrings.santriExperienceTitle,
          subtitle: AppStrings.santriExperiencePeriod,
          fixedContent: AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
          info: AppStrings.santriExperienceText
        ),
        AppUiConst.vsep16,

        ExpandableInfo(
          title: AppStrings.smallERPTitle,
          subtitle: '2006/2007',
          info: AppStrings.smallERPText
        )
      ]
    );
  }
}