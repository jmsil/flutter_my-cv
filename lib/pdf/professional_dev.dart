import '../../ui/strings/strings_model.dart';
import 'group.dart';
import 'title_detail_link.dart';

class PdfProfessionalDevelopment extends PdfMainGroup {
  PdfProfessionalDevelopment() : super.children(
    title: StringsModel.strings.professionalDevelopmentTitle,
    children: [
      PdfSubGroup.child(
        title: StringsModel.strings.certificationsTitle,
        child: PdfTitleDetailLinkTable([
          PdfTitleDetailLinkRow(
            Strings.certificationCcpiTitle, Strings.certificationCcpiDetail,
            Strings.certificationCcpiLink
          ),
          PdfTitleDetailLinkRow(
            Strings.courseSapAdvancedEventMeshTitle, Strings.mooviEducationCoursesDetail,
            Strings.courseSapAdvancedEventMeshCertificateLink
          ),
          PdfTitleDetailLinkRow(
            Strings.courseSapApiManagementTitle, Strings.mooviEducationCoursesDetail,
            Strings.courseSapApiManagementCertificateLink
          ),
          PdfTitleDetailLinkRow(
            Strings.courseSapCloudIntegration20Title, Strings.mooviEducationCoursesDetail,
            Strings.courseSapCloudIntegration20CertificateLink
          )
        ]),
        addDivider: false
      ),
      PdfSubGroup.child(
        title: StringsModel.strings.coursesTitle,
        child: PdfTitleDetailLinkTable([
          PdfTitleDetailLinkRow(
            Strings.courseSapAdvancedEventMeshTitle, Strings.courseSapAdvancedEventMeshDetail),
          PdfTitleDetailLinkRow(
            Strings.courseSapApiManagementTitle, Strings.courseSapApiManagementDetail),
          PdfTitleDetailLinkRow(
            Strings.courseSapCloudIntegration20Title, Strings.courseSapCloudIntegration20Detail),
          PdfTitleDetailLinkRow(
            StringsModel.strings.courseSapCloudIntegrationImmersionTitle,
            Strings.courseSapCloudIntegrationImmersionDetail
          ),
          PdfTitleDetailLinkRow(
            StringsModel.strings.courseOracleTitle, Strings.courseOracleDetail)
        ])
      ),
      PdfSubGroup.child(
        title: StringsModel.strings.booksTitle,
        child: PdfTitleDetailLinkTable([
          PdfTitleDetailLinkRow(
            Strings.bookEnterpriseIntegrationPatternsTitle,
            Strings.bookEnterpriseIntegrationPatternsDetail
          ),
          PdfTitleDetailLinkRow(
            Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
          PdfTitleDetailLinkRow(
            Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
          PdfTitleDetailLinkRow(
            StringsModel.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
          PdfTitleDetailLinkRow(
            StringsModel.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
        ])
      )
    ]
  );
}