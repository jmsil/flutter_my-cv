import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'expandable_info.dart';
import 'group.dart';

class ProfessionalExperienceGroup extends StatelessWidget {
  final bool scrollable;

  ProfessionalExperienceGroup(this.scrollable);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _BciForlevExperience(),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.flutterExperienceTitle,
        subtitle: '2021',
        info: AppStrings.flutterExperienceText
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.mobileGameExperienceTitle,
        subtitle: '2013 - 2020',
        info: AppStrings.mobileGameExperienceText
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.santriExperienceTitle,
        subtitle: AppStrings.santriExperiencePeriod,
        fixedContent: AppIconText(AppIcons.link, 'https://www.santri.com.br', false, true),
        info: AppStrings.santriExperienceText
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.smallErpTitle,
        subtitle: '2006/2007',
        info: AppStrings.smallErpText
      )
    ];

    return ContentGroup(
      icon: AppIcons.experience,
      title: AppStrings.professionalExperienceTitle,
      withPadding: false,
      scrollable: scrollable,
      children: children
    );
  }
}

class _BciForlevExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      title: AppStrings.fortlevExperienceTitle,
      subtitle: AppStrings.fortlevExperiencePeriod,
      fixedContent: Row(
        spacing: AppTheme.xLargeSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImageGalleryButton(AppAssets.bciFortlevDriverAppAssetsFolder),
          Column(
            spacing: AppTheme.smallSpacingValue,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconText(AppIcons.link, 'https://www.bci-consulting.com', false, true),
              AppIconText(AppIcons.link, 'https://www.fortlev.com.br', false, true)
            ]
          )
        ]
      ),
      info: AppStrings.fortlevExperienceText,
      startOpen: true
    );
  }
}