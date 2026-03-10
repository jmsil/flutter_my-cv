import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import 'expandable_info.dart';
import 'group.dart';

class EducationGroup extends ContentGroup {
  EducationGroup()
    : super(
        icon: AppIcons.education,
        title: AppStrings.educationTitle,
        withPadding: false,
        scrollable: false,
        children: [
          ExpandableInfo(
            title: AppStrings.educationUniversityTitle,
            subtitle: AppStrings.educationUniversityDetail,
            fixedContent: AppLink(text: AppStrings.educationUniversitySite, isDarkStyle: true),
            info: AppStrings.educationUniversityInfo
          )
        ]
      );
}