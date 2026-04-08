import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button/loading_button.dart';
import '../ui/const.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/theme.dart';
import 'expandable_info.dart';

class IntegrationLearningExperience extends ExpandableInfo {
  IntegrationLearningExperience()
    : super(
        headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
        headerDetail: StringsProvider .strings.sapIntegrationSuiteLearningJourneyDetail,
        infoWidget: Column(
          spacing: AppTheme.normalSpacingValue,
          children: [
            _Project(
              StringsProvider.strings.integrationProjectConversionsAndFtpTitle,
              StringsProvider.strings.integrationProjectConversionsAndFtpDescription,
              AppAssets.conversionsAndFtpAssets
            ),
            _Project(
              StringsProvider.strings.integrationProjectCalculatorTitle,
              StringsProvider.strings.integrationProjectCalculatorDescription,
              AppAssets.calculatorAssets
            )
          ]
        ),
        startOpen: true
      );
}


class _Project extends Row {
  _Project(String title, String description, ImageAssetsArchive assets)
    : super(
        spacing: AppTheme.smallSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            AppIcons.topicMark,
            color: AppTheme.darkColor
          ),
          Expanded(
            child: Column(
              spacing: AppTheme.shortSpacingValue,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.darkBoldStyle),
                Text(description, style: AppTheme.darkStyle)
              ]
            )
          ),
          AppLoadingIconButton(assets)
        ]
      );
}