import '../../ui/strings/strings_provider.dart';
import 'group.dart';

class PdfEducation extends PdfMainGroup {
  PdfEducation() : super.child(
    title: StringsProvider.strings.educationTitle,
    child: PdfSubGroup.info(
      title: StringsProvider.strings.educationUniversityTitle,
      detail: StringsProvider.strings.educationUniversityDetail,
      info: StringsProvider.strings.educationUniversityInfo,
      addDivider: false
    )
  );
}