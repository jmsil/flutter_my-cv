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
        StringsProvider.strings.integrationProjectCalculatorInfo,
        AppAssets.calculatorAssets
      );

  @override
  List<Widget> buildWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2))
    ];
  }
}


class _ConversionsAndFtp extends Project {
  _ConversionsAndFtp()
    : super(
        StringsProvider.strings.integrationProjectConversionsAndFtpTitle,
        StringsProvider.strings.integrationProjectConversionsAndFtpDescription,
        StringsProvider.strings.integrationProjectConversionsAndFtpInfo,
        AppAssets.conversionsAndFtpAssets
      );

  @override
  List<Widget> buildWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(assets.getFile(3), assets.getFile(4)),
      ProjectImageWidget(assets.getFile(5)),
      ProjectCodeWidget(assets.getFile(6), assets.getFile(7))
    ];
  }
}