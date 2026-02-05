import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import 'courses_books.dart';
import 'education.dart';
import 'items.dart';
import 'professional_experience.dart';
import 'professional_summary.dart';

class AppContent extends StatelessWidget {
  final bool isDoublePanel;
  final bool isMobileStyle;

  AppContent(this.isDoublePanel, this.isMobileStyle);

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentItems = [
      ProfessionalSummaryGroup(),
      AppUiConst.vsep16,

      if (!isDoublePanel)
        ...[
          ProfessionalExperienceGroup(false),
          AppUiConst.vsep16
        ],

      EducationGroup(),
      AppUiConst.vsep16,
      CoursesAndBooksGroup(),
      AppUiConst.vsep16,

      ItemsGroup(
        AppIcons.language,
        AppStrings.languagesTitle,
        AppStrings.languagePtText,
        AppStrings.languageEnText
      ),
      AppUiConst.vsep16,

      ItemsGroup(
        AppIcons.availability,
        AppStrings.availabilityTitle,
        AppStrings.availabilityContractText,
        AppStrings.availabilityFreelanceText
      )
    ];

    return isDoublePanel
      ? Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ProfessionalExperienceGroup(true)
              )
            ),
            Expanded(
              flex: 2,
              child: AppListView(
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                children: contentItems
              )
            )
          ]
        )
      : AppListView(
          padding: EdgeInsets.fromLTRB(16, isMobileStyle ? 0 : 16, 16, 16),
          children: contentItems
        );
  }
}