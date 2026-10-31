import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import '../ui/container/container.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_model.dart';
import '../ui/overlay_bar.dart';

class ContentGroup extends StatelessWidget {
  static const double _iconSize = 32;
  static const double _iconContainerSize = _iconSize * 2;

  final IconData icon;
  final String title;
  final Color? headerBackgroundColor;
  final bool hasHorizontalPadding;
  final List<Widget> children;

  ContentGroup.child({
    required this.icon,
    required this.title,
    this.headerBackgroundColor,
    required this.hasHorizontalPadding,
    required Widget child
  }) :
    this.children = [child];

  ContentGroup.children({
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

    final Widget builtDivider = AppContainer(
      height: 12,
      color: theme.brand3.baseColor,
      borderRadius: AppTheme.circleBorderRadius
    );

    final Widget builtIcon = _HeaderContainer(
      theme: theme,
      width: _iconContainerSize,
      height: _iconContainerSize,
      child: Icon(icon, size: _iconSize, color: theme.brand2.overColor1)
    );

    final Widget builtTitle = _HeaderContainer(
      theme: theme,
      width: 400,
      height: 52,
      padding: const AppEdgeInsets.large(vertical: 0),
      child: Center(
        child: Text(
          title, style: theme.brand2.largeText.over1.bold,
          overflow: TextOverflow.ellipsis
        )
      )
    );

    final Widget builtHeader = OverlayBar(
      startSize: _iconContainerSize / 2 + headerMargin.top,
      startBackgroundColor: headerBackgroundColor ?? theme.background.baseColor,
      endSize: _iconContainerSize / 2 + headerMargin.bottom,
      endBackgroundColor: theme.background.baseColor,
      child: Padding(
        padding: headerMargin,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            builtDivider,
            Row(
              children: [
                builtIcon,
                Expanded(
                  child: Center(child: builtTitle)
                )
              ]
            )
          ]
        )
      )
    );

    return SliverMainAxisGroup(
      slivers: [
        PinnedHeaderSliver(child: builtHeader),
        SliverPadding(
          padding: AppEdgeInsets.normal(
            top: isExtendedScreen ? 0 : null,
            bottom: isExtendedScreen ? AppEdgeInsets.xLargeValue : null,
            horizontal: hasHorizontalPadding ? null : 0
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              children,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false
            )
          )
        )
      ]
    );
  }
}

class _HeaderContainer extends AppContainer {
  _HeaderContainer({
    required AppTheme theme,
    super.width,
    super.height,
    EdgeInsets? padding,
    required Widget child
  }) : super(
    color: theme.brand3.baseColor,
    padding: const EdgeInsets.all(4),
    borderRadius: AppTheme.circleBorderRadius,
    child: AppContainer(
      color: theme.brand2.baseColor,
      padding: padding,
      borderRadius: AppTheme.circleBorderRadius,
      child: child
    )
  );
}