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
            ProjectWidget(_ConversionsAndFtp()),
            ProjectWidget(_Calculator())
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
    return [];
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
    return [];
  }
}