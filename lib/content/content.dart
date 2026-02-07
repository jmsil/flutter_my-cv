import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'courses_books.dart';
import 'education.dart';
import 'items.dart';
import 'professional_experience.dart';
import 'professional_summary.dart';

class AppContent extends StatelessWidget {
  final bool isDoublePanel;

  AppContent(this.isDoublePanel);

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
                padding: AppTheme.scaffoldAllMargin,
                child: ProfessionalExperienceGroup(true)
              )
            ),
            Expanded(
              flex: 2,
              child: AppListView(
                padding: AppTheme.scaffoldNoLeftMargin,
                children: contentItems
              )
            )
          ]
        )
      : AppListView(
          padding: AppTheme.scaffoldAllMargin,
          children: contentItems
        );
  }
}