import 'package:flutter/material.dart';

import '../../ui/layout/layout.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/viewer/project.dart';
import '../expandable.dart';
import 'apim_proxy.dart';
import 'calculator.dart';
import 'conversions_ftp.dart';
import 'exception_handler.dart';
import 'google_firebase_auth_users.dart';
import 'iflow_proxy.dart';
import 'inter_statement_oauth2_mtls.dart';
import 'mappings.dart';
import 'oauth2_tokens_handler.dart';
import 'sql_server_xslt.dart';

class IntegrationLearningExperience extends ExpandableContent {
  IntegrationLearningExperience(
    AppTheme theme
  ) : super(
    headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
    headerDetail: StringsProvider .strings.sapIntegrationSuiteLearningJourneyDetail,
    info: StringsProvider.strings.sapIntegrationSuiteLearningJourneyInfo,
    widgetAfterInfo: ExpandableContent(
      headerTitle: StringsProvider.strings.sapIntegrationSuiteLearningJourneyPortfolioTitle,
      widgetBeforeInfo: Column(
        spacing: AppLayout.normalSpacing,
        children: [
          ProjectTileWidget(theme, ApimProxyProject()),
          ProjectTileWidget(theme, IFlowProxyProject()),
          ProjectTileWidget(theme, ExceptionHandlerProject()),
          ProjectTileWidget(theme, OAuth2TokensHandlerProject()),
          ProjectTileWidget(theme, GoogleFirebaseAuthUsersProject()),
          ProjectTileWidget(theme, InterStatementOauth2MtlsProject()),
          ProjectTileWidget(theme, SqlServerXsltProject()),
          ProjectTileWidget(theme, ConversionsFtpProject()),
          ProjectTileWidget(theme, MappingsProject()),
          ProjectTileWidget(theme, CalculatorProject())
        ]
      ),
      info: StringsProvider.strings.integrationProjectsScriptCollectionInfo,
    ),
    startOpen: true
  );
}