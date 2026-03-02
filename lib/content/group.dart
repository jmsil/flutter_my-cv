import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends StatelessWidget {
  static const double _iconSize = 32;
  static const double _iconContainerSize = _iconSize * 2;

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
    final double horizontalPadding = withPadding ? 16 : 0;
    final EdgeInsets childPadding = EdgeInsets.fromLTRB(
      horizontalPadding, 16, 0, 32
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
        ),

        Flexible(
          child: scrollable
            ? AppListView(
                padding: childPadding,
                children: children
              )
            : Padding(
                padding: childPadding,
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