import 'package:flutter/material.dart';

import '../content/courses_books.dart';
import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/overlay_bar.dart';
import '../ui/scroller.dart';
import 'appbar/appbar_provider.dart';
import 'appbar/desktop_appbar.dart';
import 'main_profile_info.dart';
import 'main_scaffold.dart';
import 'sidebar/sidebar.dart';

class DesktopScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isDoublePane = context.isLargeDesktopScreen;
    final double totalCollapsedHeight = AppbarProvider.totalCollapsedHeightOf(context);

    Widget builtWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startForegroundColor: theme.backgroundColor,
      endForegroundColor: theme.backgroundColor,
      child: AppSliverScroller(
        [
          if ( ! isDoublePane)
            ExperienceGroup(),

          EducationGroup(),
          CoursesAndBooksGroup(),
          ItemsGroup.languages(),
          ItemsGroup.availability()
        ]
      )
    );

    if (isDoublePane) {
      builtWidget = Row(
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
            child: builtWidget
          )
        ]
      );
    }

    builtWidget = layout.isLeftLayout
      ? Column(
          spacing: AppLayout.largeSpacing,
          children: [
            Padding(
              padding: const AppEdgeInsets.xLarge(top: AppEdgeInsets.normalValue),
              child: MainProfileInfo.professionalSummary(
                icon: AppIcons.summary,
                style: MainProfileInfoStyle.normal,
                isOverBackground: true
              )
            ),
            Expanded(child: builtWidget)
          ]
        )
      : AppbarAnimatedPadding(
          padding: EdgeInsets.only(top: totalCollapsedHeight),
          child: builtWidget
        );

    builtWidget = Row(
      spacing: AppLayout.normalSpacing,
      children: [
        AppSidebar(),
        Expanded(child: builtWidget)
      ]
    );

    if ( ! layout.isLeftLayout) {
      builtWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          builtWidget,
          DesktopAppbar()
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: AppbarProvider(builtWidget)
    );
  }
}