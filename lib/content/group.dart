import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import '../ui/container/container.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/overlay_bar.dart';

class ContentGroup extends StatelessWidget {
  static const double _iconSize = 32;
  static const double _iconContainerSize = _iconSize * 2;
  static const double _titleContainerSize = 42;

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
    final bool isExtendedScreen = context.isExtendedScreen;

    final EdgeInsets headerMargin = AppEdgeInsets.normal(
      top: isExtendedScreen ? 0 : null,
      bottom: isExtendedScreen ? null : 0,
      horizontal: isExtendedScreen ? 0 : null
    );

    final EdgeInsets childrenPadding = AppEdgeInsets.normal(
      top: isExtendedScreen ? 0 : null,
      bottom: isExtendedScreen ? AppEdgeInsets.xLargeValue : null,
      horizontal: hasHorizontalPadding ? null : 0
    );

    final Widget headerWidget = OverlayBar(
      startSize: _iconContainerSize / 2 + headerMargin.top,
      startBackgroundColor: headerBackgroundColor ?? theme.backgroundColor,
      endSize: _iconContainerSize / 2 + headerMargin.bottom,
      endBackgroundColor: theme.backgroundColor,
      child: Padding(
        padding: headerMargin,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            AppContainer(
              height: _titleContainerSize,
              color: theme.elementColor3,
              margin: const EdgeInsets.only(left: _iconContainerSize / 2),
              borderRadius: AppTheme.circleBorderRadius,
              child: Center(
                child: Text(title, style: theme.header1OverElement3Color1BoldStyle)
              )
            ),
            AppContainer(
              width: _iconContainerSize,
              height: _iconContainerSize,
              color: theme.elementColor3,
              padding: const EdgeInsets.all(4),
              borderRadius: AppTheme.circleBorderRadius,
              child: AppContainer(
                color: theme.elementColor2,
                borderRadius: AppTheme.circleBorderRadius,
                child: Icon(icon, size: _iconSize, color: theme.overElement2Color1)
              )
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