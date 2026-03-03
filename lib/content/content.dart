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

class AppContent extends StatelessWidget {
  final bool isMobileScaffold;
  final bool isDoublePanel;

  AppContent(this.isMobileScaffold, this.isDoublePanel);

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentItems = [

      if (!isDoublePanel)
        ProfessionalExperienceGroup(false),

      EducationGroup(),
      CoursesAndBooksGroup(),
      ItemsGroup(
        AppIcons.language,
        AppStrings.languagesTitle,
        AppStrings.languagePtText,
        AppStrings.languageEnText
      ),
      ItemsGroup(
        AppIcons.availability,
        AppStrings.availabilityTitle,
        AppStrings.availabilityContractText,
        AppStrings.availabilityFreelanceText
      )
    ];

    final Widget appListView = RoundedOverlay(
      padding: isMobileScaffold ? ThemedEdgeInsets.normalValue : 0,
      radius: AppTheme.radiusValue,
      startSize: isMobileScaffold ? 32 : 0,
      startColor: isMobileScaffold ? AppTheme.highDarkColor : AppTheme.highLightColor,
      startWithBackground: isMobileScaffold,
      endColor: isMobileScaffold ? null : AppTheme.highLightColor,
      child: AppListView(
        padding: isMobileScaffold
          ? const ThemedEdgeInsets.normal(top: 0)
          : null,
        children: contentItems
      )
    );

    return isDoublePanel
      ? Row(
          spacing: 32,
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