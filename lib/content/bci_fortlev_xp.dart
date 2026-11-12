import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/theme.dart';
import '../ui/strings/strings_model.dart';
import '../ui/tabbar.dart';
import '../ui/text.dart';
import '../ui/viewer/project.dart';
import '../ui/viewer/project_card.dart';
import 'expandable.dart';

class BciFortlevExperience extends ExpandableContent {
  BciFortlevExperience(
    AppTheme theme
  ) : super(
    headerTitle: StringsModel.strings.fortlevExperienceTitle,
    headerDetail: StringsModel.strings.fortlevExperienceDetail,
    widgetBeforeInfo: AppTabBar.summaryPortfolio(
      summaryPage: Column(
        spacing: AppDimens.normal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: AppDimens.xLarge,
            runSpacing: AppDimens.small,
            children: [
              AppLink(text: Strings.bciShortLink, link: Strings.bciLink),
              AppLink(text: Strings.fortlevShortLink, link: Strings.fortlevLink)
            ]
          ),
          Text(
            StringsModel.strings.fortlevExperienceInfo,
            style: theme.background.overStyled1.normalText.regular
          )
        ]
      ),
      portfolioPage: ProjectCard(
        theme,
        GalleryProject(
          StringsModel.strings.fortlevProjectMaoDuplaTitle,
          StringsModel.strings.fortlevProjectMaoDuplaDescription,
          AppAssets.bciFortlevDriverAppAssets
        )
      )
    )
  );
}