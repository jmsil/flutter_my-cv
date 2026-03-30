import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'expandable_info.dart';
import 'group.dart';

class ExperienceGroup extends StatelessWidget {
  final bool _isSliver;
  final Color backgroundColor;

  ExperienceGroup()
    : this._isSliver = false,
      this.backgroundColor = Colors.transparent;

  ExperienceGroup.sliver(this.backgroundColor)
    : this._isSliver = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      _BciForlevExperience(),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        headerTitle: StringsProvider.strings.smartNewExperienceTitle,
        headerDetail: Strings.smartNewExperienceDetail,
        infoWidget: AppLink(
          text: Strings.smartNewShortLink,
          link: Strings.smartNewLink,
          isDarkStyle: true
        ),
        infoText: StringsProvider.strings.smartNewExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        headerTitle: StringsProvider.strings.mobileGameExperienceTitle,
        headerDetail: Strings.mobileGameExperienceDetail,
        infoText: StringsProvider.strings.mobileGameExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        headerTitle: StringsProvider.strings.santriExperienceTitle,
        headerDetail: StringsProvider.strings.santriExperienceDetail,
        infoWidget: AppLink(
          text: Strings.santriShortLink,
          link: Strings.santriLink,
          isDarkStyle: true
        ),
        infoText: StringsProvider.strings.santriExperienceInfo
      ),
      AppTheme.normalVerticalSpacing,

      ExpandableInfo(
        headerTitle: StringsProvider.strings.smallErpExperienceTitle,
        headerDetail: Strings.smallErpExperienceDetail,
        infoText: StringsProvider.strings.smallErpExperienceInfo
      )
    ];

    return _isSliver
      ? SliverContentGroup(
          icon: AppIcons.experience,
          title: StringsProvider.strings.experienceTitle,
          backgroundColor: backgroundColor,
          hasHorizontalPadding: false,
          children: children
        )
      : ContentGroup(
          icon: AppIcons.experience,
          title: StringsProvider.strings.experienceTitle,
          backgroundColor: backgroundColor,
          children: children
        );
  }
}

class _BciForlevExperience extends ExpandableInfo {
  _BciForlevExperience()
    : super(
        headerTitle: StringsProvider.strings.fortlevExperienceTitle,
        headerDetail: StringsProvider.strings.fortlevExperienceDetail,
        infoWidget: Row(
          spacing: AppTheme.xLargeSpacingValue,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageGalleryButton(AppAssets.bciFortlevDriverAppAssetsFolder),
            Column(
              spacing: AppTheme.smallSpacingValue,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLink(
                  text: Strings.bciShortLink,
                  link: Strings.bciLink,
                  isDarkStyle: true
                ),
                AppLink(
                  text: Strings.fortlevShortLink,
                  link: Strings.fortlevLink,
                  isDarkStyle: true
                )
              ]
            )
          ]
        ),
        infoText: StringsProvider.strings.fortlevExperienceInfo,
        startOpen: true
      );
}