import 'package:flutter/material.dart';

import '../content/courses_books.dart';
import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/layout/theme.dart';
import '../ui/overlay_bar.dart';
import '../ui/scroller.dart';
import 'appbar/animated_padding.dart';
import 'appbar/desktop_appbar.dart';
import 'appbar/state_provider.dart';
import 'main_scaffold.dart';
import 'sidebar/sidebar.dart';

class DesktopScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final bool isDoublePane = context.isLargeDesktopScreen;

    final List<Widget> contentChildren = [
      if ( ! isDoublePane)
        ExperienceGroup(),

      EducationGroup(),
      CoursesAndBooksGroup(),
      ItemsGroup.languages(),
      ItemsGroup.availability()
    ];

    Widget contentWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startForegroundColor: theme.backgroundColor,
      endForegroundColor: theme.backgroundColor,
      child: AppSliverScroller(contentChildren)
    );

    if (isDoublePane) {
      contentWidget = Row(
        spacing: AppLayout.xLargeSpacing,
        children: [
          Expanded(
            flex: 3,
            child: AppSliverScroller([
              ExperienceGroup()
            ])
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