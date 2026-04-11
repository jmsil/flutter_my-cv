import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/theme.dart';
import 'expandable_info.dart';
import '../ui/project.dart';

class IntegrationLearningExperience extends ExpandableInfo {
  IntegrationLearningExperience()
    : super(
        headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
        headerDetail: StringsProvider .strings.sapIntegrationSuiteLearningJourneyDetail,
        infoWidget: Column(
          spacing: AppTheme.normalSpacingValue,
          children: [
            ProjectWidget(_Calculator()),
            ProjectWidget(_ConversionsAndFtp())
          ]
        ),
        startOpen: true
      );
}


class _Calculator extends Project {
  _Calculator()
    : super(
        StringsProvider.strings.integrationProjectCalculatorTitle,
        StringsProvider.strings.integrationProjectCalculatorDescription,
        AppAssets.calculatorAssets
      );

  @override
  List<Widget> buildViewer() {
    return [
      ProjectImageWidget(assets.getImage(1), hasTopMargin: false),
      Text(StringsProvider.strings.integrationProjectCalculatorInfo, style: AppTheme.darkStyle),
      ProjectImageWidget(assets.getImage(2), hasTopMargin: true)
    ];
  }
}


class _ConversionsAndFtp extends Project {
  _ConversionsAndFtp()
    : super(
        StringsProvider.strings.integrationProjectConversionsAndFtpTitle,
        StringsProvider.strings.integrationProjectConversionsAndFtpDescription,
        AppAssets.conversionsAndFtpAssets
      );

  @override
  List<Widget> buildViewer() {
    return [
      ProjectImageWidget(assets.getImage(1), hasTopMargin: false),
      Text(
        StringsProvider.strings.integrationProjectConversionsAndFtpInfo1,
        style: AppTheme.darkStyle
      ),
      ProjectImageWidget(assets.getImage(2), hasTopMargin: true),
      ProjectImageWidget(assets.getImage(3), hasTopMargin: false),
      Text(
        StringsProvider.strings.integrationProjectConversionsAndFtpInfo2,
        style: AppTheme.darkStyle
      ),
      ProjectImageWidget(assets.getImage(4), hasTopMargin: true),
      ProjectImageWidget(assets.getImage(5), hasTopMargin: false)
    ];
  }
}