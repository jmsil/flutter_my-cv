import 'package:flutter/material.dart';

import '../../ui/container/tabbar.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_model.dart';
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
    headerTitle: StringsModel.strings.sapIntegrationSuiteLearningJourneyTitle,
    headerDetail: StringsModel .strings.sapIntegrationSuiteLearningJourneyDetail,
    widgetBeforeInfo: AppTabBar.summaryPortfolio(
      summaryPage: Text(
        StringsModel.strings.sapIntegrationSuiteLearningJourneyInfo,
        style: theme.background.normalText.over1.regular
      ),
      portfolioPage: Column(
        spacing: AppLayout.normalSpacing,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: AppLayout.normalSpacing,
            runSpacing: AppLayout.normalSpacing,
            alignment: WrapAlignment.center,
            children: [
              ProjectCard(theme, ApimProxyProject()),
              ProjectCard(theme, IFlowProxyProject()),
              ProjectCard(theme, ExceptionHandlerProject()),
              ProjectCard(theme, OAuth2TokensHandlerProject()),
              ProjectCard(theme, GoogleFirebaseAuthUsersProject()),
              ProjectCard(theme, InterStatementOauth2MtlsProject()),
              ProjectCard(theme, SqlServerXsltProject()),
              ProjectCard(theme, ConversionsFtpProject()),
              ProjectCard(theme, MappingsProject()),
              ProjectCard(theme, CalculatorProject())
            ]
          ),
          Text(
            StringsModel.strings.integrationProjectsScriptCollectionInfo,
            style: theme.background.normalText.decoration.italic
          )
        ]
      )
    )
  );
}