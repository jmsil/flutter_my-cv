import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme/icons.dart';
import 'bci_fortlev_xp.dart';
import 'expandable.dart';
import 'group.dart';
import 'integration_learning_xp.dart';

class ExperienceGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      IntegrationLearningExperience(),
      AppLayout.normalVerticalSpacer,

      BciFortlevExperience(),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.smartNewExperienceTitle,
        headerDetail: Strings.smartNewExperienceDetail,
        infoWidget: AppLink(text: Strings.smartNewShortLink, link: Strings.smartNewLink),
        infoText: StringsProvider.strings.smartNewExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.mobileGameExperienceTitle,
        headerDetail: Strings.mobileGameExperienceDetail,
        infoText: StringsProvider.strings.mobileGameExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.santriExperienceTitle,
        headerDetail: StringsProvider.strings.santriExperienceDetail,
        infoWidget: AppLink(text: Strings.santriShortLink, link: Strings.santriLink),
        infoText: StringsProvider.strings.santriExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.smallErpExperienceTitle,
        headerDetail: Strings.smallErpExperienceDetail,
        infoText: StringsProvider.strings.smallErpExperienceInfo
      )
    ];

    return ContentGroup(
      icon: AppIcons.experience,
      title: StringsProvider.strings.experienceTitle,
      headerBackgroundColor: context.isDesktopScreen
        ? null
        : LayoutProvider.theme.elementColor1,
      hasHorizontalPadding: false,
      children: children
    );
  }
}