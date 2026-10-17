import '../ui/layout/icons.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';
import 'expandable.dart';
import 'group.dart';

class EducationGroup extends ContentGroup {
  EducationGroup() : super(
    icon: AppIcons.education,
    title: StringsModel.strings.educationTitle,
    hasHorizontalPadding: false,
    children: [
      ExpandableContent(
        headerTitle: StringsModel.strings.educationUniversityTitle,
        headerDetail: StringsModel.strings.educationUniversityDetail,
        widgetBeforeInfo: AppLink(
          text: Strings.educationUniversityShortLink,
          link: Strings.educationUniversityLink
        ),
        info: StringsModel.strings.educationUniversityInfo
      )
    ]
  );
}