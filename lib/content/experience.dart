import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import 'bci_fortlev_xp.dart';
import 'expandable.dart';
import 'group.dart';
import 'integration_learning_xp/integration_learning_xp.dart';

class ExperienceGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    List<Widget> children = [
      IntegrationLearningExperience(theme),
      AppLayout.normalVerticalSpacer,

      BciFortlevExperience(),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.smartNewExperienceTitle,
        headerDetail: Strings.smartNewExperienceDetail,
        widgetBeforeInfo: AppLink(text: Strings.smartNewShortLink, link: Strings.smartNewLink),
        info: StringsProvider.strings.smartNewExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.mobileGameExperienceTitle,
        headerDetail: Strings.mobileGameExperienceDetail,
        info: StringsProvider.strings.mobileGameExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.santriExperienceTitle,
        headerDetail: StringsProvider.strings.santriExperienceDetail,
        widgetBeforeInfo: AppLink(text: Strings.santriShortLink, link: Strings.santriLink),
        info: StringsProvider.strings.santriExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsProvider.strings.smallErpExperienceTitle,
        headerDetail: Strings.smallErpExperienceDetail,
        info: StringsProvider.strings.smallErpExperienceInfo
      )
    ];

    return ContentGroup(
      icon: AppIcons.experience,
      title: StringsProvider.strings.experienceTitle,
      headerBackgroundColor: isExtendedScreen
        ? null
        : theme.elementColor1,
      hasHorizontalPadding: false,
      children: children
    );
  }
}