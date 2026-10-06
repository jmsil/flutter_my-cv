import 'package:flutter/material.dart';

import '../ui/layout/icons.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import 'expandable.dart';
import 'group.dart';

class ProfessionalDevelopmentGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget builtCertificationsWidget = ExpandableContent(
      headerTitle: StringsProvider.strings.certificationsTitle,
      widgetBeforeInfo: Column(
        spacing: AppLayout.normalSpacing,
        children: [
          _Item(
            Strings.certificationCcpiTitle,
            Strings.certificationCcpiDetail,
            Strings.certificationCcpiLink
          ),
          _Item(
            Strings.courseSapAdvancedEventMeshTitle,
            Strings.mooviEducationCoursesDetail,
            Strings.courseSapAdvancedEventMeshCertificateLink
          ),
          _Item(
            Strings.courseSapApiManagementTitle,
            Strings.mooviEducationCoursesDetail,
            Strings.courseSapApiManagementCertificateLink
          ),
          _Item(
            Strings.courseSapCloudIntegration20Title,
            Strings.mooviEducationCoursesDetail,
            Strings.courseSapCloudIntegration20CertificateLink
          )
        ]
      )
    );

    final Widget builtCoursesWidget = ExpandableContent(
      headerTitle: StringsProvider.strings.coursesTitle,
      widgetBeforeInfo: Column(
        spacing: AppLayout.normalSpacing,
        children: [
          _Item(
            Strings.courseSapAdvancedEventMeshTitle,
            Strings.courseSapAdvancedEventMeshDetail
          ),
          _Item(
            Strings.courseSapApiManagementTitle,
            Strings.courseSapApiManagementDetail
          ),
          _Item(
            Strings.courseSapCloudIntegration20Title,
            Strings.courseSapCloudIntegration20Detail
          ),
          _Item(
            StringsProvider.strings.courseSapCloudIntegrationImmersionTitle,
            Strings.courseSapCloudIntegrationImmersionDetail
          ),
          _Item(
            StringsProvider.strings.courseOracleTitle,
            Strings.courseOracleDetail
          )
        ]
      )
    );

    final Widget builtBooksWidget = ExpandableContent(
      headerTitle: StringsProvider.strings.booksTitle,
      widgetBeforeInfo: Column(
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
      title: StringsProvider.strings.professionalDevelopmentTitle,
      hasHorizontalPadding: false,
      children: [
        builtCertificationsWidget,
        AppLayout.smallVerticalSpacer,
        builtCoursesWidget,
        AppLayout.smallVerticalSpacer,
        builtBooksWidget
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
    final AppTheme theme = context.appLayout.theme;
    Widget builtDetailWidget = Text(detail, style: theme.text1OverBackgroundColor1ItalicStyle);

    if (certificateLink != null) {
      builtDetailWidget = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          builtDetailWidget,
          AppLink(text: StringsProvider.strings.verifyCertification, link: certificateLink)
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
              builtDetailWidget
            ]
          )
        )
      ]
    );
  }
}