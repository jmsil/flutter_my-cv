import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class ContentGroup extends StatelessWidget {
  static const double _pinSize = 32;
  static const double _headerHeight = 40;
  static const double _topExtraMargin = 10;

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
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      hasPadding ? 12 : 0,
      _headerHeight / 2 + (hasPadding ? 16 : 8),
      hasPadding ? 12 : 0,
      hasPadding ? 16 : 8
    );

    return Stack(
      alignment: Alignment.topRight,
      children: [
        AppContainer(
          color: AppTheme.highLightColor,
          margin: const EdgeInsets.only(top: _headerHeight / 2 + _topExtraMargin),
          padding: hasListView ? EdgeInsets.zero : contentPadding,
          borderRadius: AppTheme.defaultRadius,
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
          margin: const EdgeInsets.fromLTRB(16, _topExtraMargin, 16, 0),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          borderColor: AppTheme.darkBlue.withValues(alpha: 0.36),
          borderRadius: AppTheme.defaultRadius,
          hasShadow: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppTheme.darkColor),
              AppUiConst.hsep8,
              Flexible(
                child: Text(title, style: AppTheme.darkBoldStyle)
              )
            ]
          )
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Stack(
            children: [
              Icon(AppIcons.pin, size: _pinSize, color: AppTheme.highLightColor),
              Icon(AppIcons.pin_outlined, size: _pinSize, color: AppTheme.midDarkColor)
            ]
          )
        )
      ]
    );
  }
}