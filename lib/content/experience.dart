import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';
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
        headerTitle: StringsModel.strings.smartNewExperienceTitle,
        headerDetail: Strings.smartNewExperienceDetail,
        widgetBeforeInfo: AppLink(text: Strings.smartNewShortLink, link: Strings.smartNewLink),
        info: StringsModel.strings.smartNewExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsModel.strings.mobileGameExperienceTitle,
        headerDetail: Strings.mobileGameExperienceDetail,
        info: StringsModel.strings.mobileGameExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsModel.strings.santriExperienceTitle,
        headerDetail: StringsModel.strings.santriExperienceDetail,
        widgetBeforeInfo: AppLink(text: Strings.santriShortLink, link: Strings.santriLink),
        info: StringsModel.strings.santriExperienceInfo
      ),
      AppLayout.normalVerticalSpacer,

      ExpandableContent(
        headerTitle: StringsModel.strings.smallErpExperienceTitle,
        headerDetail: Strings.smallErpExperienceDetail,
        info: StringsModel.strings.smallErpExperienceInfo
      )
    ];

    return ContentGroup(
      icon: AppIcons.experience,
      title: StringsModel.strings.experienceTitle,
      headerBackgroundColor: isExtendedScreen
        ? null
        : theme.elementColor1,
      hasHorizontalPadding: false,
      children: children
    );
  }
}