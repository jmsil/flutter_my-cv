import '../../ui/strings/strings_provider.dart';
import 'group.dart';

class PdfExperience extends PdfMainGroup {
  PdfExperience() : super.children(
    title: StringsProvider.strings.experienceTitle,
    children: [
      PdfSubGroup.info(
        title: StringsProvider.strings.sapIntegrationSuiteLearningJourneyTitle,
        detail: StringsProvider.strings.sapIntegrationSuiteLearningJourneyDetail,
        info: '',
        addDivider: false
      ),
      PdfSubGroup.info(
        title: StringsProvider.strings.fortlevExperienceTitle,
        detail: StringsProvider.strings.fortlevExperienceDetail,
        info: StringsProvider.strings.fortlevExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsProvider.strings.smartNewExperienceTitle,
        detail: Strings.smartNewExperienceDetail,
        info: StringsProvider.strings.smartNewExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsProvider.strings.mobileGameExperienceTitle,
        detail: Strings.mobileGameExperienceDetail,
        info: StringsProvider.strings.mobileGameExperienceInfo
      ),
      PdfSubGroup.info(
        title:StringsProvider.strings.santriExperienceTitle,
        detail: StringsProvider.strings.santriExperienceDetail,
        info: StringsProvider.strings.santriExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsProvider.strings.smallErpExperienceTitle,
        detail: Strings.smallErpExperienceDetail,
        info: StringsProvider.strings.smallErpExperienceInfo
      )
    ]
  );
}