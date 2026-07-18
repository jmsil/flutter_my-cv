import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme/icons.dart';
import 'expandable.dart';
import 'group.dart';

class EducationGroup extends ContentGroup {
  EducationGroup()
    : super(
        icon: AppIcons.education,
        title: StringsProvider.strings.educationTitle,
        hasHorizontalPadding: false,
        children: [
          ExpandableContent(
            headerTitle: StringsProvider.strings.educationUniversityTitle,
            headerDetail: StringsProvider.strings.educationUniversityDetail,
            infoWidget: AppLink(
              text: Strings.educationUniversityShortLink,
              link: Strings.educationUniversityLink
            ),
            infoText: StringsProvider.strings.educationUniversityInfo
          )
        ]
      );
}