import '../../ui/strings/strings_model.dart';
import 'group.dart';

class PdfEducation extends PdfMainGroup {
  PdfEducation() : super.child(
    title: StringsModel.strings.educationTitle,
    child: PdfSubGroup.info(
      title: StringsModel.strings.educationUniversityTitle,
      detail: StringsModel.strings.educationUniversityDetail,
      info: StringsModel.strings.educationUniversityInfo,
      addDivider: false
    )
  );
}