import 'package:flutter/material.dart';

import '../ui/container/container.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends StatelessWidget {
  static const double _baseSpace = 16;
  static const double _iconSize = 32;
  static const double _iconContainerSize = _iconSize * 2;
  static const double _headerHeight = 40;

  final IconData icon;
  final String title;
  final bool hasPadding;
  final bool scrollable;
  final List<Widget> children;

  ContentGroup({
    required this.icon,
    required this.title,
    this.hasPadding = true,
    this.scrollable = false,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = hasPadding ? _baseSpace : 0;
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      padding,
      _iconContainerSize / 2 + _baseSpace,
      padding,
      _baseSpace
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppContainer(
          color: AppTheme.highLightColor,
          margin: const EdgeInsets.only(top: _iconContainerSize / 2),
          padding: scrollable ? EdgeInsets.zero : contentPadding,
          borderRadius: AppTheme.allRadius,
          isClipped: scrollable,
          child: scrollable
            ? AppListView(
                padding: contentPadding,
                children: children
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children
              )
        ),

        AppContainer(
          height: _headerHeight,
          color: AppTheme.lowLightColor,
          margin: const EdgeInsets.only(
            left: _baseSpace + _iconContainerSize / 2,
            top: _iconContainerSize / 2 - _headerHeight / 2,
            right: _baseSpace
          ),
          borderColor: AppTheme.midDarkColor.withValues(alpha: 0.5),
          borderRadius: AppTheme.allRadius,
          hasShadow: true,
          child: Center(
            child: Text(title, style: AppTheme.largeDarkBoldStyle)
          )
        ),

        AppContainer(
          width: _iconContainerSize,
          height: _iconContainerSize,
          color: AppTheme.midDarkColor,
          borderRadius: BorderRadius.circular(_iconContainerSize),
          margin: const EdgeInsets.only(left: _baseSpace),
          hasShadow: true,
          child: Icon(icon, size: _iconSize, color: AppTheme.highLightColor)
        )
      ]
    );
  }
}