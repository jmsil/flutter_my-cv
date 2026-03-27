import '../ui/const.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import 'expandable_info.dart';
import 'group.dart';

class EducationGroup extends SliverContentGroup {
  EducationGroup()
    : super(
        icon: AppIcons.education,
        title: StringsProvider.strings.educationTitle,
        hasHorizontalPadding: false,
        children: [
          ExpandableInfo(
            title: StringsProvider.strings.educationUniversityTitle,
            subtitle: StringsProvider.strings.educationUniversityDetail,
            fixedContent: AppLink(
              text: Strings.educationUniversityShortLink,
              link: Strings.educationUniversityLink,
              isDarkStyle: true
            ),
            info: StringsProvider.strings.educationUniversityInfo
          )
        ]
      );
}