import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'expandable_info.dart';
import 'group.dart';

class ExperienceGroup extends StatelessWidget {
  final bool scrollable;

  ExperienceGroup(this.scrollable);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _BciForlevExperience(),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.smartNewExperienceTitle,
        subtitle: AppStrings.smartNewExperienceDetail,
        fixedContent: AppLink(text: AppStrings.smartNewLink, isDarkStyle: true),
        info: AppStrings.smartNewExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.mobileGameExperienceTitle,
        subtitle: AppStrings.mobileGameExperienceDetail,
        info: AppStrings.mobileGameExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.santriExperienceTitle,
        subtitle: AppStrings.santriExperienceDetail,
        fixedContent: AppLink(text: AppStrings.santriLink, isDarkStyle: true),
        info: AppStrings.santriExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.smallErpExperienceTitle,
        subtitle: AppStrings.smallErpExperienceDetail,
        info: AppStrings.smallErpExperienceInfo
      )
    ];

    return ContentGroup(
      icon: AppIcons.experience,
      title: AppStrings.experienceTitle,
      withPadding: false,
      scrollable: scrollable,
      children: children
    );
  }
}

class _BciForlevExperience extends ExpandableInfo {
  _BciForlevExperience()
    : super(
        title: AppStrings.fortlevExperienceTitle,
        subtitle: AppStrings.fortlevExperienceDetail,
        fixedContent: Row(
          spacing: AppTheme.xLargeSpacingValue,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageGalleryButton(AppAssets.bciFortlevDriverAppAssetsFolder),
            Column(
              spacing: AppTheme.smallSpacingValue,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLink(text: AppStrings.bciLink, isDarkStyle: true),
                AppLink(text: AppStrings.fortlevLink, isDarkStyle: true)
              ]
            )
          ]
        ),
        info: AppStrings.fortlevExperienceInfo,
        startOpen: true
      );
}