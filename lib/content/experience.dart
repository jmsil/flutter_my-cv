import 'package:flutter/material.dart';

import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/main_group.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';
import 'bci_fortlev_xp.dart';
import 'expandable.dart';
import 'integration_learning_xp/integration_learning_xp.dart';

class ExperienceGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;

    List<Widget> children = [
      IntegrationLearningExperience(theme),
      AppLayout.normalVerticalSpacer,

      BciFortlevExperience(theme),
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

    return MainGroup.children(
      icon: AppIcons.briefcase,
      title: StringsModel.strings.experienceTitle,
      isPrimaryGroup: true,
      enableBodyHorizontalPadding: false,
      children: children
    );
  }
}