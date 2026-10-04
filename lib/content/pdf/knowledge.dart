import '../../ui/strings/strings_provider.dart';
import 'group.dart';
import 'title_detail_row.dart';

class PdfKnowledgeImprovements extends PdfMainGroup {
  PdfKnowledgeImprovements() : super.children(
    title: StringsProvider.strings.knowledgeImprovementsTitle,
    children: [
      PdfSubGroup.children(
        title: StringsProvider.strings.certificationsTitle,
        children: [
          PdfTitleDetailRow(
            Strings.certificationCcpiTitle, Strings.certificationCcpiDetail),
          PdfTitleDetailRow(
            Strings.courseSapAdvancedEventMeshTitle, Strings.mooviEducationCoursesDetail),
          PdfTitleDetailRow(
            Strings.courseSapApiManagementTitle, Strings.mooviEducationCoursesDetail),
          PdfTitleDetailRow(
            Strings.courseSapCloudIntegration20Title, Strings.mooviEducationCoursesDetail)
        ],
        addDivider: false
      ),
      PdfSubGroup.children(
        title: StringsProvider.strings.coursesTitle,
        children: [
          PdfTitleDetailRow(
            Strings.courseSapAdvancedEventMeshTitle, Strings.courseSapAdvancedEventMeshDetail),
          PdfTitleDetailRow(
            Strings.courseSapApiManagementTitle, Strings.courseSapApiManagementDetail),
          PdfTitleDetailRow(
            Strings.courseSapCloudIntegration20Title, Strings.courseSapCloudIntegration20Detail),
          PdfTitleDetailRow(
            StringsProvider.strings.courseSapCloudIntegrationImmersionTitle,
            Strings.courseSapCloudIntegrationImmersionDetail
          ),
          PdfTitleDetailRow(
            StringsProvider.strings.courseOracleTitle, Strings.courseOracleDetail)
        ]
      ),
      PdfSubGroup.children(
        title: StringsProvider.strings.booksTitle,
        children: [
          PdfTitleDetailRow(
            Strings.bookEnterpriseIntegrationPatternsTitle,
            Strings.bookEnterpriseIntegrationPatternsDetail
          ),
          PdfTitleDetailRow(
            Strings.bookCleanArchitectureTitle, Strings.booksCleanCodeArchDetail),
          PdfTitleDetailRow(
            Strings.bookCleanCodeTitle, Strings.booksCleanCodeArchDetail),
          PdfTitleDetailRow(
            StringsProvider.strings.bookGoogleAndroidTitle, Strings.bookGoogleAndroidDetail),
          PdfTitleDetailRow(
            StringsProvider.strings.bookDelphiBibleTitle, Strings.bookDelphiBibleDetail)
        ]
      )
    ]
  );
}