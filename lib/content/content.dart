import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/rounded_overlay.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'courses_books.dart';
import 'education.dart';
import 'items.dart';
import 'professional_experience.dart';
import 'professional_summary.dart';

class AppContent extends StatelessWidget {
  final bool isMobileScaffold;
  final bool isDoublePanel;

  AppContent(this.isMobileScaffold, this.isDoublePanel);

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

    final Widget appListView = RoundedOverlay(
      padding: isMobileScaffold ? AppTheme.scaffoldPaddingValue : 0,
      radius: AppTheme.radiusValue,
      startSize: isMobileScaffold ? 80 : 0,
      startColor: isMobileScaffold ? AppTheme.highDarkColor : AppTheme.midLightColor,
      startWithBackground: isMobileScaffold,
      endColor: isMobileScaffold ? null : AppTheme.midLightColor,
      child: AppListView(
        padding: isMobileScaffold ? AppTheme.scaffoldPadding.copyWith(top: 0) : null,
        children: contentItems
      )
    );

    return isDoublePanel
      ? Row(
          spacing: 16,
          children: [
            Expanded(
              flex: 3,
              child: ProfessionalExperienceGroup(true)
            ),
            Expanded(
              flex: 2,
              child: appListView
            )
          ]
        )
      : appListView;
  }
}