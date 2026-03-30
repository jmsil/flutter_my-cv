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
            headerTitle: StringsProvider.strings.educationUniversityTitle,
            headerDetail: StringsProvider.strings.educationUniversityDetail,
            infoWidget: AppLink(
              text: Strings.educationUniversityShortLink,
              link: Strings.educationUniversityLink,
              isDarkStyle: true
            ),
            infoText: StringsProvider.strings.educationUniversityInfo
          )
        ]
      );
}