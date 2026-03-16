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
  final bool _isSliver;
  final Color backgroundColor;

  ExperienceGroup()
    : this._isSliver = false,
      this.backgroundColor = AppTheme.highLightColor;

  ExperienceGroup.sliver({
    required this.backgroundColor
  })
    : this._isSliver = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _BciForlevExperience(),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.smartNewExperienceTitle,
        subtitle: AppStrings.smartNewExperienceDetail,
        fixedContent: AppLink(
          text: AppStrings.smartNewShortLink,
          link: AppStrings.smartNewLink,
          isDarkStyle: true
        ),
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
        fixedContent: AppLink(
          text: AppStrings.santriShortLink,
          link: AppStrings.santriLink,
          isDarkStyle: true
        ),
        info: AppStrings.santriExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        title: AppStrings.smallErpExperienceTitle,
        subtitle: AppStrings.smallErpExperienceDetail,
        info: AppStrings.smallErpExperienceInfo
      )
    ];

    return _isSliver
      ? SliverContentGroup(
          icon: AppIcons.experience,
          title: AppStrings.experienceTitle,
          backgroundColor: backgroundColor,
          hasHorizontalPadding: false,
          children: children
        )
      : ContentGroup(
          icon: AppIcons.experience,
          title: AppStrings.experienceTitle,
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
                AppLink(
                  text: AppStrings.bciShortLink,
                  link: AppStrings.bciLink,
                  isDarkStyle: true
                ),
                AppLink(
                  text: AppStrings.fortlevShortLink,
                  link: AppStrings.fortlevLink,
                  isDarkStyle: true
                )
              ]
            )
          ]
        ),
        info: AppStrings.fortlevExperienceInfo,
        startOpen: true
      );
}