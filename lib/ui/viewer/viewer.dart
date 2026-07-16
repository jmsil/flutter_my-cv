import 'dart:ui';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../theme.dart';

class AppViewer extends StatefulWidget {
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
    AppViewerKey? key,
    required this.direction,
    this.windowWidth,
    this.windowHeight,
    this.barWidth,
    this.barHeight,
    required this.barPadding,
    required this.bodyIsTransparent,
    required this.barWidget,
    required this.bodyWidget
  })
    : super(key: key);

  @override
  _State createState() => _State();

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


class _State extends State<AppViewer> {
  Widget? fullscreenWidget;

  @override
  Widget build(BuildContext context) {
    final Widget composedBarWidget = AppContainer(
      width: widget.barWidth,
      height: widget.barHeight,
      padding: widget.barPadding,
      color: AppTheme.highDarkColor.withValues(alpha: 0.6),
      child: widget.barWidget
    );

    final Widget composedBodyWidget = Expanded(
      child: AppContainer(
        color: widget.bodyIsTransparent
          ? AppTheme.highLightColor.withValues(alpha: 0.88)
          : AppTheme.highLightColor,
        child: IndexedStack(
          clipBehavior: Clip.none,
          index: fullscreenWidget == null ? 0 : 1,
          children: [
            widget.bodyWidget,

            if (fullscreenWidget != null)
              Padding(
                padding: const AppEdgeInsets.normal(),
                child: fullscreenWidget
              )
          ]
        )
      )
    );

    return Center(
      child: AppContainer(
        width: widget.windowWidth,
        height: widget.windowHeight,
        margin: const AppEdgeInsets.normal(),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Flex(
            direction: widget.direction,
            children: [
              composedBarWidget,
              composedBodyWidget
            ]
          )
        )
      )
    );
  }

  void setFullscreenWidget(Widget? widget) {
    setState(() => fullscreenWidget = widget);
  }
}


class AppViewerKey extends GlobalKey {
  AppViewerKey() : super.constructor();

  _State? get _state => currentState as _State?;

  bool get isInFullscreen => _state?.fullscreenWidget != null;

  void setFullscreenWidget(Widget? widget) => _state?.setFullscreenWidget(widget);
}