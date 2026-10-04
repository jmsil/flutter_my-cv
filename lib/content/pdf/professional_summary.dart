import '../../ui/strings/strings_provider.dart';
import 'group.dart';
import 'text.dart';
import 'theme.dart';

class PdfProfessionalSummary extends PdfMainGroup {
  PdfProfessionalSummary() : super.children(
    title: StringsProvider.strings.professionalSummaryTitle,
    children: [
      PdfText(StringsProvider.strings.professionalSummaryInfo, style: PdfTheme.largeTextStyle),
      PdfSubGroup.info(
        title: StringsProvider.strings.programmingSkillsTitle,
        info: Strings.programmingSkillsInfo.replaceAll('-', PdfText.bulletReplacer)
      ),
      PdfSubGroup.info(
        title: StringsProvider.strings.integrationSkillsTitle,
        info: Strings.integrationSkillsInfo.replaceAll('-', PdfText.bulletReplacer)
      )
    ]
  );
}