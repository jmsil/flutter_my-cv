import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/layout/layout.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/theme/theme.dart';
import '../ui/viewer/project.dart';
import '../ui/viewer/project_code.dart';
import '../ui/viewer/project_image.dart';
import 'expandable.dart';

class IntegrationLearningExperience extends ExpandableContent {
  IntegrationLearningExperience(AppTheme theme)
    : super(
        headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
        headerDetail: StringsProvider .strings.sapIntegrationSuiteLearningJourneyDetail,
        infoWidget: Column(
          spacing: AppLayout.normalSpacing,
          children: [
            ProjectTileWidget(theme, _ApimProxy()),
            ProjectTileWidget(theme, _SqlServerWithXslt()),
            ProjectTileWidget(theme, _Calculator()),
            ProjectTileWidget(theme, _ConversionsAndFtp()),
            ProjectTileWidget(theme, _ExceptionHandler())
          ]
        ),
        startOpen: true
      );
}

class _ApimProxy extends Project {
  _ApimProxy()
    : super(
        StringsProvider.strings.integrationProjectApimProxyTitle,
        StringsProvider.strings.integrationProjectApimProxyDescription,
        StringsProvider.strings.integrationProjectApimProxyInfo,
        AppAssets.apimProxyAssets
      );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1))
    ];
  }
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
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(viewerKey, assets, [3])
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
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(viewerKey, assets, [3, 4]),
      ProjectImageWidget(assets.getFile(5)),
      ProjectCodeWidget(viewerKey, assets, [6, 7])
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
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(viewerKey, assets, [2, 3]),
      ProjectImageWidget(assets.getFile(4))
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
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(viewerKey, assets, [3, 4, 5], [4, 7, 7])
    ];
  }
}