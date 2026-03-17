import 'package:flutter/material.dart';

import '../content/courses_books.dart';
import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../ui/container/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/desktop_appbar.dart';
import 'appbar/state_provider.dart';
import 'main_scaffold.dart';
import 'sidebar.dart';

class DesktopScaffold extends StatelessWidget {
  final Function() onPressedPt;
  final Function() onPressedEn;

  DesktopScaffold(this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final bool isDoublePanel = context.isLargeDesktopScreen;

    final List<Widget> contentChildren = [
      if (!isDoublePanel)
        ExperienceGroup.sliver(AppTheme.mainScaffoldBackgroundColor),

      EducationGroup(),
      CoursesAndBooksGroup(),
      ItemsGroup.languages(),
      ItemsGroup.availability()
    ];

    Widget contentWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startForegroundColor: AppTheme.mainScaffoldBackgroundColor,
      endForegroundColor: AppTheme.mainScaffoldBackgroundColor,
      child: AppSliverScroller(contentChildren)
    );

    if (isDoublePanel) {
      contentWidget = Row(
        spacing: AppTheme.xLargeSpacingValue,
        children: [
          Expanded(
            flex: 3,
            child: ExperienceGroup()
          ),
          Expanded(
            flex: 2,
            child: contentWidget
          )
        ]
      );
    }

    return Padding(
      padding: const ThemedEdgeInsets.normal(),
      child: AppbarStateProvider(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              spacing: AppTheme.normalSpacingValue,
              children: [
                AppSidebar(onPressedPt, onPressedEn),
                Expanded(
                  child: AppbarAnimatedPadding(
                    padding: EdgeInsets.only(top: AppbarStateProvider.totalCollapsedHeight),
                    child: contentWidget
                  )
                )
              ]
            ),
            DesktopAppbar()
          ]
        )
      )
    );
  }
}