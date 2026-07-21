import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/container/container.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/overlay_bar.dart';

class ContentGroup extends StatelessWidget {
  static const double iconSize = 32;
  static const double iconContainerSize = iconSize * 2;
  static const double titleContainerSize = 42;

  final IconData icon;
  final String title;
  final Color? headerBackgroundColor;
  final bool hasHorizontalPadding;
  final List<Widget> children;

  ContentGroup({
    required this.icon,
    required this.title,
    this.headerBackgroundColor,
    required this.hasHorizontalPadding,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final bool isDesktopScreen = context.isDesktopScreen;

    final EdgeInsets headerMargin = AppEdgeInsets.normal(
      top: isDesktopScreen ? 0 : null,
      bottom: isDesktopScreen ? null : 0,
      horizontal: isDesktopScreen ? 0 : null
    );

    final EdgeInsets childrenPadding = AppEdgeInsets.normal(
      top: isDesktopScreen ? 0 : null,
      bottom: isDesktopScreen ? AppEdgeInsets.xLargeValue : null,
      horizontal: hasHorizontalPadding ? null : 0
    );

    final Widget headerWidget = OverlayBar(
      startSize: iconContainerSize / 2 + headerMargin.top,
      startBackgroundColor: headerBackgroundColor ?? theme.backgroundColor,
      endSize: iconContainerSize / 2 + headerMargin.bottom,
      endBackgroundColor: theme.backgroundColor,
      child: Padding(
        padding: headerMargin,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            AppContainer(
              height: titleContainerSize,
              color: theme.elementColor3,
              margin: const EdgeInsets.only(left: iconContainerSize / 2),
              borderColor: theme.elementColor2.withValues(alpha: 0.5),
              borderRadius: AppTheme.circleBorderRadius,
              child: Center(
                child: Text(title, style: theme.header1OverElement3Color1BoldStyle)
              )
            ),
            AppContainer(
              width: iconContainerSize,
              height: iconContainerSize,
              color: theme.elementColor2,
              borderRadius: AppTheme.circleBorderRadius,
              child: Icon(icon, size: iconSize, color: theme.overElement2Color1)
            )
          ]
        )
      )
    );

    return SliverMainAxisGroup(
      slivers: [
        PinnedHeaderSliver(child: headerWidget),
        SliverToBoxAdapter(
          child: Padding(
            padding: childrenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children
            )
          )
        )
      ]
    );
  }
}