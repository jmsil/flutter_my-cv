import 'package:flutter/material.dart';

import '../scaffold/main_scaffold.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends StatelessWidget {
  static const double _iconSize = 32;
  static const double _iconContainerSize = _iconSize * 2;
  static const EdgeInsets _childNoPadding = EdgeInsets.fromLTRB(
    0, ThemedEdgeInsets.normalValue, 0, ThemedEdgeInsets.xLargeValue
  );
  static const EdgeInsets _childWithPadding = ThemedEdgeInsets.normal(
    bottom: ThemedEdgeInsets.xLargeValue
  );

  final IconData icon;
  final String title;
  final bool withPadding;
  final bool scrollable;
  final List<Widget> children;

  ContentGroup({
    required this.icon,
    required this.title,
    required this.withPadding,
    required this.scrollable,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;

    Widget headerWidget = Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        AppContainer(
          height: 40,
          color: AppTheme.lowLightColor,
          margin: const EdgeInsets.only(left: _iconContainerSize / 2),
          borderColor: AppTheme.lowDarkColor.withValues(alpha: 0.5),
          borderRadius: AppUiConst.circleBorderRadius,
          child: Center(
            child: Text(title, style: AppTheme.largeDarkBoldStyle)
          )
        ),
        AppContainer(
          width: _iconContainerSize,
          height: _iconContainerSize,
          color: AppTheme.lowDarkColor,
          borderRadius: AppUiConst.circleBorderRadius,
          child: Icon(icon, size: _iconSize, color: AppTheme.highLightColor)
        )
      ]
    );

    if (!isDesktopScreen) {
      headerWidget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemedEdgeInsets.normalValue),
        child: headerWidget
      );
    }

    final Widget contentWidget = scrollable
      ? AppListView(
          padding: withPadding ? _childWithPadding : _childNoPadding,
          children: children
        )
      : Padding(
          padding: withPadding ? _childWithPadding : _childNoPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          )
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerWidget,
        Flexible(
          child: contentWidget
        )
      ]
    );
  }
}