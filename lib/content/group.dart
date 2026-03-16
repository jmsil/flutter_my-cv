import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends Column {
  ContentGroup({
    required IconData icon,
    required String title,
    required List<Widget> children
  })
    : super(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(icon, title, Colors.transparent, true),
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
    final EdgeInsets childrenPadding = EdgeInsets.only(
      left: hasHorizontalPadding ? ThemedEdgeInsets.normalValue : 0,
      top: isDesktopScreen ? 0 : ThemedEdgeInsets.normalValue,
      right:  hasHorizontalPadding ? ThemedEdgeInsets.normalValue : 0,
      bottom: isDesktopScreen ? ThemedEdgeInsets.xLargeValue : ThemedEdgeInsets.normalValue
    );

    return SliverMainAxisGroup(
      slivers: [
        PinnedHeaderSliver(
          child: _Header(icon, title, backgroundColor ?? AppTheme.highLightColor, isDesktopScreen)
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
  static const double titleContainerSize = 40;

  final IconData icon;
  final String title;
  final Color backgroundColor;
  final bool isDesktopScreen;

  _Header(this.icon, this.title, this.backgroundColor, this.isDesktopScreen);

  @override
  Widget build(BuildContext context) {
    final double topPadding = isDesktopScreen ? 0 : ThemedEdgeInsets.normalValue;
    final double bottomPadding = isDesktopScreen ? ThemedEdgeInsets.normalValue : 0;
    final double horizontalPadding = isDesktopScreen ? 0 : ThemedEdgeInsets.normalValue;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (backgroundColor != Colors.transparent)
          OverlayBarBox(true, iconContainerSize / 2 + topPadding, backgroundColor),

        AppContainer(
          height: titleContainerSize,
          color: AppTheme.lowLightColor,
          margin: EdgeInsets.only(
            left: iconContainerSize / 2 + horizontalPadding,
            top: (iconContainerSize - titleContainerSize) / 2 + topPadding,
            right: horizontalPadding
          ),
          borderColor: AppTheme.lowDarkColor.withValues(alpha: 0.5),
          borderRadius: AppUiConst.circleBorderRadius,
          child: Center(
            child: Text(title, style: AppTheme.largeDarkBoldStyle)
          )
        ),
        AppContainer(
          width: iconContainerSize,
          height: iconContainerSize,
          margin: EdgeInsets.only(
            left: horizontalPadding,
            top: topPadding,
            bottom: bottomPadding
          ),
          color: AppTheme.lowDarkColor,
          borderRadius: AppUiConst.circleBorderRadius,
          child: Icon(icon, size: iconSize, color: AppTheme.highLightColor)
        )
      ]
    );
  }
}