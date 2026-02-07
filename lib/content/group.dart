import 'package:flutter/material.dart';

import '../ui/const.dart';
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
  final bool hasListView;
  final List<Widget> children;

  ContentGroup({
    required this.icon,
    required this.title,
    this.hasPadding = true,
    this.hasListView = false,
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
      children: [
        AppContainer(
          color: AppTheme.highLightColor,
          margin: const EdgeInsets.only(top: _iconContainerSize / 2),
          padding: hasListView ? EdgeInsets.zero : contentPadding,
          borderRadius: AppTheme.appThemeRadius,
          isClipped: hasListView,
          child: hasListView
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
          borderColor: AppTheme.darkBlue.withValues(alpha: 0.36),
          borderRadius: AppTheme.appThemeRadius,
          hasShadow: true,
          child: Center(
            child: Text(title, style: AppTheme.largeDarkBoldStyle)
          )
        ),

        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(
              top: _iconContainerSize / 2 - _iconSize + 2,
              right: _baseSpace + 4
            ),
            child: Stack(
              children: [
                Icon(AppIcons.pin, size: _iconSize, color: AppTheme.highLightColor),
                Icon(AppIcons.pin_outlined, size: _iconSize, color: AppTheme.midDarkColor)
              ]
            )
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