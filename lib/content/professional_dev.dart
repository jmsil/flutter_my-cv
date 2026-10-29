import 'package:flutter/material.dart';

import '../ui/container/tabbar.dart';
import '../ui/container/wrap.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';
import 'group.dart';
import 'professional_dev_card.dart';

class ProfessionalDevelopmentGroup extends StatelessWidget {
  static const double _cardWidth = 340;

  @override
  Widget build(BuildContext context) {
    final Widget builtCertificationsWidget = AppWrap(
      width: _cardWidth,
      spacing: AppLayout.normalSpacing,
      children: [
        ProfessionalDevelopmentCard(
          Strings.certificationCcpiTitle,
          Strings.certificationCcpiDetail,
          certificateLink: Strings.certificationCcpiLink
        ),
        ProfessionalDevelopmentCard(
          Strings.courseSapAdvancedEventMeshTitle,
          Strings.mooviEducationCoursesDetail,
          certificateLink: Strings.courseSapAdvancedEventMeshCertificateLink
        ),
        ProfessionalDevelopmentCard(
          Strings.courseSapApiManagementTitle,
          Strings.mooviEducationCoursesDetail,
          certificateLink: Strings.courseSapApiManagementCertificateLink
        ),
        ProfessionalDevelopmentCard(
          Strings.courseSapCloudIntegration20Title,
          Strings.mooviEducationCoursesDetail,
          certificateLink: Strings.courseSapCloudIntegration20CertificateLink
        )
      ]
    );

    final Widget builtCoursesWidget = AppWrap(
      width: _cardWidth,
      spacing: AppLayout.normalSpacing,
      children: [
        ProfessionalDevelopmentCard(
          Strings.courseSapAdvancedEventMeshTitle,
          Strings.courseSapAdvancedEventMeshDetail
        ),
        ProfessionalDevelopmentCard(
          Strings.courseSapApiManagementTitle,
          Strings.courseSapApiManagementDetail
        ),
        ProfessionalDevelopmentCard(
          Strings.courseSapCloudIntegration20Title,
          Strings.courseSapCloudIntegration20Detail
        ),
        ProfessionalDevelopmentCard(
          StringsModel.strings.courseSapCloudIntegrationImmersionTitle,
          Strings.courseSapCloudIntegrationImmersionDetail
        ),
        ProfessionalDevelopmentCard(
          StringsModel.strings.courseOracleTitle,
          Strings.courseOracleDetail
        )
      ]
    );

    final Widget builtBooksWidget = AppWrap(
      width: _cardWidth,
      spacing: AppLayout.normalSpacing,
      children: [
        ProfessionalDevelopmentCard(
          Strings.bookEnterpriseIntegrationPatternsTitle,
          Strings.bookEnterpriseIntegrationPatternsDetail
        ),
        ProfessionalDevelopmentCard(
          Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
        ProfessionalDevelopmentCard(
          Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
        ProfessionalDevelopmentCard(
          StringsModel.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
        ProfessionalDevelopmentCard(
          StringsModel.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
      ]
    );

    return ContentGroup.child(
      icon: AppIcons.trendUp,
      title: StringsModel.strings.professionalDevelopmentTitle,
      hasHorizontalPadding: true,
      child: AppTabBar(
        tabs: [
          AppTabBarTab(AppIcons.certificate, StringsModel.strings.certificationsTitle),
          AppTabBarTab(AppIcons.course, StringsModel.strings.coursesTitle),
          AppTabBarTab(AppIcons.book, StringsModel.strings.booksTitle)
        ],
        pages: [
          builtCertificationsWidget,
          builtCoursesWidget,
          builtBooksWidget
        ]
      )
    );
  }
}