import 'package:flutter/material.dart';

import '../content/courses_books.dart';
import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/desktop_appbar.dart';
import 'appbar/state_provider.dart';
import 'main_scaffold.dart';
import 'sidebar/sidebar.dart';

class DesktopScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDoublePane = context.isLargeDesktopScreen;

    final List<Widget> contentChildren = [
      if (!isDoublePane)
        ExperienceGroup.sliver(AppTheme.mainScaffoldBackgroundColor),

      EducationGroup(),
      CoursesAndBooksGroup(),
      ItemsGroup.languages(),
      ItemsGroup.availability()
    ];

    Widget contentWidget = OverlayBar(
      radius: LayoutProvider.theme.radiusValue,
      startForegroundColor: AppTheme.mainScaffoldBackgroundColor,
      endForegroundColor: AppTheme.mainScaffoldBackgroundColor,
      child: AppSliverScroller(contentChildren)
    );

    if (isDoublePane) {
      contentWidget = Row(
        spacing: AppLayout.xLargeSpacing,
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
      padding: const AppEdgeInsets.normal(),
      child: AppbarStateProvider(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              spacing: AppLayout.normalSpacing,
              children: [
                AppSidebar(),
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