import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends Column {
  ContentGroup({
    required IconData icon,
    required String title,
    required Color backgroundColor,
    required List<Widget> children
  })
    : super(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(icon, title, backgroundColor, true),
          Expanded(
            child: AppListView(
              children: children
            )
          )
        ]
      );
}

class SliverContentGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;
  final bool hasHorizontalPadding;
  final List<Widget> children;

  SliverContentGroup({
    required this.icon,
    required this.title,
    this.backgroundColor,
    required this.hasHorizontalPadding,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;
    final EdgeInsets childrenPadding = AppEdgeInsets.normal(
      top: isDesktopScreen ? 0 : null,
      bottom: isDesktopScreen ? AppEdgeInsets.xLargeValue : null,
      horizontal: hasHorizontalPadding ? null : 0
    );

    return SliverMainAxisGroup(
      slivers: [
        PinnedHeaderSliver(
          child: _Header(
            icon, title, backgroundColor ?? AppTheme.mainScaffoldBackgroundColor, isDesktopScreen
          )
        ),
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

class _Header extends StatelessWidget {
  static const double iconSize = 32;
  static const double iconContainerSize = iconSize * 2;
  static const double titleContainerSize = 42;

  final IconData icon;
  final String title;
  final Color backgroundColor;
  final bool isDesktopScreen;

  _Header(this.icon, this.title, this.backgroundColor, this.isDesktopScreen);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets margin = AppEdgeInsets.normal(
      top: isDesktopScreen ? 0 : null,
      bottom: isDesktopScreen ? null : 0,
      horizontal: isDesktopScreen ? 0 : null
    );

    return OverlayBar(
      startSize: iconContainerSize / 2 + margin.top,
      startBackgroundColor: backgroundColor,
      endSize: iconContainerSize / 2 + margin.bottom,
      endBackgroundColor: AppTheme.mainScaffoldBackgroundColor,
      child: Padding(
        padding: margin,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            AppContainer(
              height: titleContainerSize,
              color: AppTheme.lowLightColor,
              margin: const EdgeInsets.only(left: iconContainerSize / 2),
              borderColor: AppTheme.lowDarkColor.withValues(alpha: 0.5),
              borderRadius: AppUiConst.circleBorderRadius,
              child: Center(
                child: Text(title, style: AppTheme.largeDarkBoldStyle)
              )
            ),
            AppContainer(
              width: iconContainerSize,
              height: iconContainerSize,
              color: AppTheme.lowDarkColor,
              borderRadius: AppUiConst.circleBorderRadius,
              child: Icon(icon, size: iconSize, color: AppTheme.highLightColor)
            )
          ]
        )
      )
    );
  }
}