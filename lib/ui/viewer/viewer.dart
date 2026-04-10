import 'dart:ui';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../theme.dart';

class AppViewer extends StatelessWidget {
  final Axis direction;
  final double? windowWidth;
  final double? windowHeight;
  final double? barWidth;
  final double? barHeight;
  final EdgeInsets barPadding;
  final bool bodyIsTransparent;
  final Widget barWidget;
  final Widget bodyWidget;

  AppViewer({
    required this.direction,
    this.windowWidth,
    this.windowHeight,
    this.barWidth,
    this.barHeight,
    required this.barPadding,
    required this.bodyIsTransparent,
    required this.barWidget,
    required this.bodyWidget
  });

  @override
  Widget build(BuildContext context) {
    final Widget composedBarWidget = AppContainer(
      width: barWidth,
      height: barHeight,
      padding: barPadding,
      color: AppTheme.highDarkColor.withValues(alpha: 0.6),
      child: barWidget
    );

    final Widget composedBodyWidget = Expanded(
      child: AppContainer(
        color: bodyIsTransparent
          ? AppTheme.highLightColor.withValues(alpha: 0.88)
          : AppTheme.highLightColor,
        child: bodyWidget
      )
    );

    return Center(
      child: AppContainer(
        width: windowWidth,
        height: windowHeight,
        margin: const ThemedEdgeInsets.normal(),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Flex(
            direction: direction,
            children: [
              composedBarWidget,
              composedBodyWidget
            ]
          )
        )
      )
    );
  }

  static void show(BuildContext context, Widget viewer) {
    showGeneralDialog<void>(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      transitionDuration: const Duration(milliseconds: 380),

      transitionBuilder: (transCtx, transAnim, transSecAnim, transChild) {
        return FadeUpwardsPageTransitionsBuilder().buildTransitions(
          null, transCtx, transAnim, transSecAnim, transChild
        );
      },

      pageBuilder: (pageCtx, pageAnim, pageSecAnim) {
        return viewer;
      }
    );
  }
}