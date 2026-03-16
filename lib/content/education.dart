import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import 'expandable_info.dart';
import 'group.dart';

class EducationGroup extends SliverContentGroup {
  EducationGroup()
    : super(
        icon: AppIcons.education,
        title: AppStrings.educationTitle,
        hasHorizontalPadding: false,
        children: [
          ExpandableInfo(
            title: AppStrings.educationUniversityTitle,
            subtitle: AppStrings.educationUniversityDetail,
            fixedContent: AppLink(
              text: AppStrings.educationUniversityShortLink,
              link: AppStrings.educationUniversityLink,
              isDarkStyle: true
            ),
            info: AppStrings.educationUniversityInfo
          )
        ]
      );
}