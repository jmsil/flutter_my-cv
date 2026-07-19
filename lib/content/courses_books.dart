import 'package:flutter/material.dart';

import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme/icons.dart';
import '../ui/theme/theme.dart';
import 'expandable.dart';
import 'group.dart';

class CoursesAndBooksGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget coursesWidget = ExpandableContent(
      headerTitle: StringsProvider.strings.coursesTitle,
      infoWidget: Column(
        spacing: AppLayout.normalSpacing,
        children: [
          _Item(
            Strings.courseSapAdvancedEventMeshTitle,
            Strings.mooviEducation,
            Strings.courseSapAdvancedEventMeshCertificateLink
          ),
          _Item(
            Strings.courseSapApiManagementTitle,
            Strings.mooviEducation,
            Strings.courseSapApiManagementCertificateLink
          ),
          _Item(
            Strings.courseSapCloudIntegration20Title,
            Strings.mooviEducation,
            Strings.courseSapCloudIntegration20CertificateLink
          ),
          _Item(
            StringsProvider.strings.courseSapCloudIntegrationImmersionTitle,
            StringsProvider.strings.courseSapCloudIntegrationImmersionDetail
          ),
          _Item(StringsProvider.strings.courseOracleTitle, Strings.courseOracleDetail)
        ]
      )
    );

    final Widget booksWidget = ExpandableContent(
      headerTitle: StringsProvider.strings.booksTitle,
      infoWidget: Column(
        spacing: AppLayout.normalSpacing,
        children: [
          _Item(
            Strings.bookEnterpriseIntegrationPatternsTitle,
            Strings.bookEnterpriseIntegrationPatternsDetail
          ),
          _Item(Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
          _Item(Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
          _Item(StringsProvider.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
          _Item(StringsProvider.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
        ]
      )
    );

    return ContentGroup(
      icon: AppIcons.studying,
      title: StringsProvider.strings.coursesAndBooksTitle,
      hasHorizontalPadding: false,
      children: [
        coursesWidget,
        AppLayout.smallVerticalSpacer,
        booksWidget
      ]
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String detail;
  final String? certificateLink;

  _Item(this.title, String detail, [this.certificateLink])
    : this.detail = detail + (certificateLink != null ? ' ▪ ' : '');

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.providerTheme;
    Widget composedDetailWidget = Text(detail, style: theme.text1OverBackgroundColor1ItalicStyle);

    if (certificateLink != null) {
      composedDetailWidget = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          composedDetailWidget,
          AppLink(text: StringsProvider.strings.verifyCertificate, link: certificateLink)
        ]
      );
    }

    return Row(
      spacing: AppLayout.smallSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(AppIcons.topicMark, color: theme.overBackgroundColor1),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.text1OverBackgroundColor1BoldStyle),
              composedDetailWidget
            ]
          )
        )
      ]
    );
  }
}