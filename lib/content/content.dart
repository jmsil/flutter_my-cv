import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/const.dart';
import '../ui/container/rounded_overlay.dart';
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

    Widget appListView = isDesktopScreen
      ? AppListView(
          children: contentItems
        )
      : Column(
          children: contentItems
        );

    appListView = RoundedOverlay(
      padding: isDesktopScreen ? 0 : ThemedEdgeInsets.normalValue,
      radius: AppTheme.radiusValue,
      startSize: isDesktopScreen ? 0 : 32,
      startColor: isDesktopScreen ? AppTheme.highLightColor : AppTheme.highDarkColor,
      startHasBackground: !isDesktopScreen,
      endColor: isDesktopScreen ? AppTheme.highLightColor : null,
      child: appListView
    );

    if (!isDesktopScreen) {
      appListView = SliverList(
        delegate: SliverChildListDelegate([appListView])
      );
    }

    if (!isDoublePanel)
      return appListView;

    return Row(
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
    );
  }
}