import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/rounded_overlay.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'courses_books.dart';
import 'education.dart';
import 'items.dart';
import 'experience.dart';

class AppContent extends StatelessWidget {
  final bool isMobileScaffold;
  final bool isDoublePanel;

  AppContent(this.isMobileScaffold, this.isDoublePanel);

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentItems = [

      if (!isDoublePanel)
        ExperienceGroup(false),

      EducationGroup(),

      CoursesAndBooksGroup(),

      ItemsGroup(
        icon: AppIcons.language,
        title: AppStrings.languagesTitle,
        info: AppStrings.languagesInfo
      ),

      ItemsGroup(
        icon: AppIcons.availability,
        title: AppStrings.availabilityTitle,
        info: AppStrings.availabilityInfo
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
          spacing: AppTheme.xLargeSpacingValue,
          children: [
            Expanded(
              flex: 3,
              child: ExperienceGroup(true)
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