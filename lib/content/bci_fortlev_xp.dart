import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/container/tabbar.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/theme.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';
import '../ui/viewer/project.dart';
import 'expandable.dart';

class BciFortlevExperience extends ExpandableContent {
  BciFortlevExperience(
    AppTheme theme
  ) : super(
    headerTitle: StringsModel.strings.fortlevExperienceTitle,
    headerDetail: StringsModel.strings.fortlevExperienceDetail,
    widgetBeforeInfo: AppTabBar.summaryPortfolio(
      theme: theme,
      summaryPage: Column(
        spacing: AppLayout.normalSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: AppLayout.xLargeSpacing,
            runSpacing: AppLayout.smallSpacing,
            children: [
              AppLink(text: Strings.bciShortLink, link: Strings.bciLink),
              AppLink(text: Strings.fortlevShortLink, link: Strings.fortlevLink)
            ]
          ),
          Text(
            StringsModel.strings.fortlevExperienceInfo,
            style: theme.background.normalText.over1.regular
          )
        ]
      ),
      portfolioPage: ProjectTileWidget(
        theme,
        GalleryProject(
          StringsModel.strings.fortlevProjectMaoDuplaTitle,
          StringsModel.strings.fortlevProjectMaoDuplaDescription,
          AppAssets.bciFortlevDriverAppAssets
        )
      )
    ),
    startOpen: false
  );
}