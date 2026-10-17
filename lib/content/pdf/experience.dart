import '../../ui/strings/strings_model.dart';
import 'group.dart';

class PdfExperience extends PdfMainGroup {
  PdfExperience() : super.children(
    title: StringsModel.strings.experienceTitle,
    children: [
      PdfSubGroup.info(
        title: StringsModel.strings.sapIntegrationSuiteLearningJourneyTitle,
        detail: StringsModel.strings.sapIntegrationSuiteLearningJourneyDetail,
        info: StringsModel.strings.sapIntegrationSuiteLearningJourneyInfo,
        addDivider: false
      ),
      PdfSubGroup.info(
        title: StringsModel.strings.fortlevExperienceTitle,
        detail: StringsModel.strings.fortlevExperienceDetail,
        info: StringsModel.strings.fortlevExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsModel.strings.smartNewExperienceTitle,
        detail: Strings.smartNewExperienceDetail,
        info: StringsModel.strings.smartNewExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsModel.strings.mobileGameExperienceTitle,
        detail: Strings.mobileGameExperienceDetail,
        info: StringsModel.strings.mobileGameExperienceInfo
      ),
      PdfSubGroup.info(
        title:StringsModel.strings.santriExperienceTitle,
        detail: StringsModel.strings.santriExperienceDetail,
        info: StringsModel.strings.santriExperienceInfo
      ),
      PdfSubGroup.info(
        title: StringsModel.strings.smallErpExperienceTitle,
        detail: Strings.smallErpExperienceDetail,
        info: StringsModel.strings.smallErpExperienceInfo
      )
    ]
  );
}