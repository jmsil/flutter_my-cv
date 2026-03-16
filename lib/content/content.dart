import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/const.dart';
import '../ui/container/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'courses_books.dart';
import 'education.dart';
import 'experience.dart';
import 'items.dart';

class AppContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;
    final bool isDoublePanel = context.isLargeDesktopScreen;

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

    Widget returnWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startSize: isDesktopScreen ? 0 : 32,
      startBackgroundColor: isDesktopScreen ? null : AppTheme.highDarkColor,
      startForegroundColor: isDesktopScreen ? AppTheme.highLightColor : null,
      endForegroundColor: isDesktopScreen ? AppTheme.highLightColor : null,
      child: isDesktopScreen
        ? AppListView(children: contentItems)
        : Column(children: contentItems)
    );

    if (isDoublePanel) {
      returnWidget = Row(
        spacing: AppTheme.xLargeSpacingValue,
        children: [
          Expanded(
            flex: 3,
            child: ExperienceGroup(true)
          ),
          Expanded(
            flex: 2,
            child: returnWidget
          )
        ]
      );
    }

    return returnWidget;
  }
}