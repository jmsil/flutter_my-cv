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
            ProjectWidget(_SqlServerWithXslt()),
            ProjectWidget(_Calculator()),
            ProjectWidget(_ConversionsAndFtp()),
            ProjectWidget(_ExceptionHandler())
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
      ProjectCodeWidget(assets, [2])
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
      ProjectCodeWidget(assets, [3, 4]),
      ProjectImageWidget(assets.getFile(5)),
      ProjectCodeWidget(assets, [6, 7])
    ];
  }
}


class _ExceptionHandler extends Project {
  _ExceptionHandler()
    : super(
        StringsProvider.strings.integrationProjectExceptionHandlerTitle,
        StringsProvider.strings.integrationProjectExceptionHandlerDescription,
        StringsProvider.strings.integrationProjectExceptionHandlerInfo,
        AppAssets.exceptionHandlerAssets
      );

  @override
  List<Widget> buildWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(assets, [2])
    ];
  }
}


class _SqlServerWithXslt extends Project {
  _SqlServerWithXslt()
    : super(
        StringsProvider.strings.integrationProjectSqlServerWithXsltTitle,
        StringsProvider.strings.integrationProjectSqlServerWithXsltDescription,
        StringsProvider.strings.integrationProjectSqlServerWithXsltInfo,
        AppAssets.sqlServerWithXsltAssets
      );

  @override
  List<Widget> buildWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(assets, [3, 4, 5], [4, 7, 7])
    ];
  }
}