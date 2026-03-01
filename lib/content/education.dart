import '../ui/const.dart';
import '../ui/strings.dart';
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
            subtitle: '2006 - 2008',
            info: AppStrings.educationUniversityText
          )
        ]
      );
}