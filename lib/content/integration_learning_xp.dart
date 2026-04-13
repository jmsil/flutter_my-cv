import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/theme.dart';
import '../ui/viewer/project.dart';
import '../ui/viewer/project_code.dart';
import '../ui/viewer/project_image.dart';
import 'expandable_info.dart';

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
      ProjectImageWidget(assets.getFile(1), false, true),
      Text(
        StringsProvider.strings.integrationProjectCalculatorInfo,
        style: AppTheme.darkStyle
      ),
      ProjectImageWidget(assets.getFile(2), true, true)
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
      ProjectImageWidget(assets.getFile(1), false, true),
      Text(
        StringsProvider.strings.integrationProjectConversionsAndFtpInfo1,
        style: AppTheme.darkStyle
      ),
      ProjectImageWidget(assets.getFile(2), true, false),
      ProjectCodeWidget(assets.getFile(3), assets.getFile(4), true, true),
      Text(
        StringsProvider.strings.integrationProjectConversionsAndFtpInfo2,
        style: AppTheme.darkStyle
      ),
      ProjectImageWidget(assets.getFile(5), true, false),
      ProjectCodeWidget(assets.getFile(6), assets.getFile(7), true, true)
    ];
  }
}