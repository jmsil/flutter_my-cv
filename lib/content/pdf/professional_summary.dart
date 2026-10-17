import '../../ui/strings/strings_model.dart';
import 'group.dart';
import 'text.dart';
import 'theme.dart';

class PdfProfessionalSummary extends PdfMainGroup {
  PdfProfessionalSummary() : super.children(
    title: StringsModel.strings.professionalSummaryTitle,
    children: [
      PdfText(StringsModel.strings.professionalSummaryInfo, style: PdfTheme.largeTextStyle),
      PdfSubGroup.info(
        title: StringsModel.strings.programmingSkillsTitle,
        info: Strings.programmingSkillsInfo.replaceAll('-', PdfText.bulletReplacer)
      ),
      PdfSubGroup.info(
        title: StringsModel.strings.integrationSkillsTitle,
        info: Strings.integrationSkillsInfo.replaceAll('-', PdfText.bulletReplacer)
      )
    ]
  );
}