import '../../ui/strings/strings_provider.dart';
import 'group.dart';
import 'title_detail_link.dart';

class PdfProfessionalDevelopment extends PdfMainGroup {
  PdfProfessionalDevelopment() : super.children(
    title: StringsProvider.strings.professionalDevelopmentTitle,
    children: [
      PdfSubGroup.child(
        title: StringsProvider.strings.certificationsTitle,
        child: PdfTitleDetailLinkTable(
          children: [
            PdfTitleDetailLinkRow(
              Strings.certificationCcpiTitle, Strings.certificationCcpiDetail,
              certificationLink: Strings.certificationCcpiLink),
            PdfTitleDetailLinkRow(
              Strings.courseSapAdvancedEventMeshTitle, Strings.mooviEducationCoursesDetail,
              certificationLink: Strings.courseSapAdvancedEventMeshCertificateLink
            ),
            PdfTitleDetailLinkRow(
              Strings.courseSapApiManagementTitle, Strings.mooviEducationCoursesDetail,
              certificationLink: Strings.courseSapApiManagementCertificateLink
            ),
            PdfTitleDetailLinkRow(
              Strings.courseSapCloudIntegration20Title, Strings.mooviEducationCoursesDetail,
              certificationLink: Strings.courseSapCloudIntegration20CertificateLink
            )
          ]
        ),
        addDivider: false
      ),
      PdfSubGroup.child(
        title: StringsProvider.strings.coursesTitle,
        child: PdfTitleDetailLinkTable(
          children: [
            PdfTitleDetailLinkRow(
              Strings.courseSapAdvancedEventMeshTitle, Strings.courseSapAdvancedEventMeshDetail),
            PdfTitleDetailLinkRow(
              Strings.courseSapApiManagementTitle, Strings.courseSapApiManagementDetail),
            PdfTitleDetailLinkRow(
              Strings.courseSapCloudIntegration20Title, Strings.courseSapCloudIntegration20Detail),
            PdfTitleDetailLinkRow(
              StringsProvider.strings.courseSapCloudIntegrationImmersionTitle,
              Strings.courseSapCloudIntegrationImmersionDetail
            ),
            PdfTitleDetailLinkRow(
              StringsProvider.strings.courseOracleTitle, Strings.courseOracleDetail)
          ]
        )
      ),
      PdfSubGroup.child(
        title: StringsProvider.strings.booksTitle,
        child: PdfTitleDetailLinkTable(
          isColumn0Flex: true,
          isSpacingFlex: false,
          children: [
            PdfTitleDetailLinkRow(
              Strings.bookEnterpriseIntegrationPatternsTitle,
              Strings.bookEnterpriseIntegrationPatternsDetail
            ),
            PdfTitleDetailLinkRow(
              Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
            PdfTitleDetailLinkRow(
              Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
            PdfTitleDetailLinkRow(
              StringsProvider.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
            PdfTitleDetailLinkRow(
              StringsProvider.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
          ]
        )
      )
    ]
  );
}