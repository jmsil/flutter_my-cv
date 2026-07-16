import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button/loading_button.dart';
import '../ui/const.dart';
import '../ui/layout/layout.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import 'expandable_info.dart';
import 'group.dart';
import 'integration_learning_xp.dart';

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
      IntegrationLearningExperience(),
      AppLayout.normalVerticalSpacer,

      _BciForlevExperience(),
      AppLayout.normalVerticalSpacer,

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
      AppLayout.normalVerticalSpacer,

      ExpandableInfo(
        headerTitle: StringsProvider.strings.mobileGameExperienceTitle,
        headerDetail: Strings.mobileGameExperienceDetail,
        infoText: StringsProvider.strings.mobileGameExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

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
      AppLayout.normalVerticalSpacer,

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
          spacing: AppLayout.xLargeSpacing,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Wrap(
                spacing: AppLayout.xLargeSpacing,
                runSpacing: AppLayout.smallSpacing,
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
            ),
            AppGalleryButton(AppAssets.bciFortlevDriverAppAssets)
          ]
        ),
        infoText: StringsProvider.strings.fortlevExperienceInfo,
        startOpen: false
      );
}