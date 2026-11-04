import 'dart:math';

import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import 'layout/dimens.dart';
import 'layout/layout_model.dart';

const double _lineSize = 12;
const double _borderSize = 4;
const double _iconBoxSize = 64;
const double _titleBoxWidth = 400;
const double _titleBoxHeight = 52;

class MainGroup extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isPrimaryGroup;
  final bool enableBodyHorizontalPadding;
  final List<Widget> children;

  MainGroup.child({
    required this.icon,
    required this.title,
    this.isPrimaryGroup = false,
    required this.enableBodyHorizontalPadding,
    required Widget child
  }) :
    this.children = [child];

  MainGroup.children({
    required this.icon,
    required this.title,
    this.isPrimaryGroup = false,
    required this.enableBodyHorizontalPadding,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final bool isExtendedScreen = context.isExtendedScreen;
    final double headerSpacing = _iconBoxSize / 4;

    final EdgeInsets headerPadding = AppEdgeInsets.normal(
      top: isExtendedScreen ? 0 : null,
      bottom: isExtendedScreen ? null : 0,
      horizontal: isExtendedScreen ? 0 : null
    );

    final Widget builtHeader = CustomPaint(
      painter: _Painter(theme, headerPadding, isPrimaryGroup && ! isExtendedScreen),
      child: SizedBox(
        height: _iconBoxSize + headerPadding.vertical,
        child: Padding(
          padding: headerPadding + EdgeInsets.only(left: headerSpacing),
          child: Row(
            spacing: headerSpacing,
            children: [
              Icon(icon, size: _iconBoxSize / 2, color: theme.brand2.overColor1),
              Expanded(
                child: Center(
                  child: Text(
                    title, style: theme.brand2.largeText.over1.bold,
                    overflow: TextOverflow.ellipsis
                  )
                )
              )
            ]
          )
        )
      )
    );

    return SliverMainAxisGroup(
      slivers: [
        PinnedHeaderSliver(child: builtHeader),
        SliverPadding(
          padding: AppEdgeInsets.normal(
            top: isExtendedScreen ? 0 : null,
            bottom: isExtendedScreen ? AppDimens.xLarge : null,
            horizontal: enableBodyHorizontalPadding ? null : 0
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

class _Painter extends CustomPainter {
  static final Paint _paint = Paint()
    ..isAntiAlias = false;

  final AppTheme theme;
  final EdgeInsets padding;
  final bool drawTopBackground;

  _Painter(this.theme, this.padding, this.drawTopBackground);

  @override
  void paint(Canvas canvas, Size size) {
    final RRect lineRect = getLineRect(size);
    final RRect iconRect = getIconRect();
    final RRect titleRect = getTitleRect(size);

    _paint.color = theme.background.baseColor;
    canvas.drawRect(Rect.fromLTRB(0, 0, size.width, size.height), _paint);

    if (drawTopBackground) {
      _paint.color = theme.brand1.baseColor;
      canvas.drawRect(Rect.fromLTRB(0, 0, size.width, padding.top + _iconBoxSize / 2), _paint);
    }

    _paint.color = theme.brand3.baseColor;
    canvas.drawRRect(lineRect, _paint);
    canvas.drawRRect(iconRect, _paint);
    canvas.drawRRect(titleRect, _paint);

    _paint.color = theme.brand2.baseColor;
    canvas.drawRRect(iconRect.deflate(_borderSize), _paint);
    canvas.drawRRect(titleRect.deflate(_borderSize), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  RRect getLineRect(Size canvasSize) {
    double top = padding.top + _iconBoxSize / 2 - _lineSize / 2;
    return RRect.fromLTRBR(
      padding.left,
      top,
      canvasSize.width - padding.right,
      top + _lineSize,
      AppTheme.circleRadius
    );
  }

  RRect getIconRect() {
    return RRect.fromLTRBR(
      padding.left,
      padding.top,
      padding.left + _iconBoxSize,
      padding.top + _iconBoxSize,
      AppTheme.circleRadius
    );
  }

  RRect getTitleRect(Size canvasSize) {
    double top = padding.top + _iconBoxSize / 2 - _titleBoxHeight / 2;
    double availableWidth = canvasSize.width - padding.horizontal - _iconBoxSize;
    double width = min(availableWidth, _titleBoxWidth);
    double left = padding.left + _iconBoxSize + availableWidth / 2 - width / 2;
    return RRect.fromLTRBR(
      left,
      top,
      left + width,
      top + _titleBoxHeight,
      AppTheme.circleRadius
    );
  }
}