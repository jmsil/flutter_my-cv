import 'dart:ui';

import 'package:flutter/material.dart';

import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_provider.dart';

abstract class AppViewer extends StatefulWidget {
  final Axis direction;
  final double? windowWidth;
  final double? windowHeight;
  final double? barSize;
  final EdgeInsets barPadding;
  final bool isTransparentBody;

  AppViewer({
    required this.direction,
    this.windowWidth,
    this.windowHeight,
    this.barSize,
    required this.barPadding,
    required this.isTransparentBody
  });

  @override
  AppViewerState createState();

  static void show(BuildContext context, AppViewer viewer) {
    showGeneralDialog<void>(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      transitionDuration: AppTheme.animationDuration,

      transitionBuilder: (transCtx, transAnim, transSecAnim, transChild) {
        return FadeUpwardsPageTransitionsBuilder().buildTransitions(
          null, transCtx, transAnim, transSecAnim, transChild
        );
      },

      pageBuilder: (pageCtx, pageAnim, pageSecAnim) => viewer
    );
  }

  static bool isInFullScreenOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<_Notifier>()?.notifier?.value != null;
  }

  static void setFullScreenOf(BuildContext context, Widget? widget) {
    context.getInheritedWidgetOfExactType<_Notifier>()?.notifier?.value = widget;
  }
}

abstract class AppViewerState<T extends AppViewer> extends State<T> {
  final ValueNotifier<Widget?> _valueNotifier = ValueNotifier(null);

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isVerticalDirection = widget.direction == Axis.vertical;
    final bool isHorizontalDirection = widget.direction == Axis.horizontal;

    final bool showBarBackground =
      isVerticalDirection && layout.showTopbarBackground ||
      isHorizontalDirection && layout.showSidebarBackground;

    final Color barColor = showBarBackground
      ? theme.elementColor1
      : theme.backgroundColor;

    final Widget builtBarWidget = AppContainer(
      width: isHorizontalDirection ? widget.barSize : null,
      height: isVerticalDirection ? widget.barSize : null,
      padding: widget.barPadding,
      color: barColor.withValues(alpha: 0.6),
      child: buildBarWidget(context, showBarBackground)
    );

    final Widget builtBodyWidget = AppContainer(
      color: widget.isTransparentBody
        ? theme.backgroundColor.withValues(alpha: 0.9)
        : theme.backgroundColor,
      child: _Notifier(
        notifier: _valueNotifier,
        child: _IndexedStack(
          child: buildBodyWidget(context)
        )
      )
    );

    return Center(
      child: AppContainer(
        width: widget.windowWidth,
        height: widget.windowHeight,
        margin: const AppEdgeInsets.normal(),
        borderSize: 2,
        borderColor: showBarBackground
          ? theme.overElement1Color1.withValues(alpha: 0.48)
          : null,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Flex(
            direction: widget.direction,
            children: [
              builtBarWidget,
              Expanded(
                child: builtBodyWidget
              )
            ]
          )
        )
      )
    );
  }

  Widget buildBarWidget(BuildContext context, bool showBarBackground);
  Widget buildBodyWidget(BuildContext context);
}

class _IndexedStack extends StatelessWidget {
  final child;

  _IndexedStack({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? fullScreenWidget =
      context.dependOnInheritedWidgetOfExactType<_Notifier>()?.notifier?.value;

    return IndexedStack(
      clipBehavior: Clip.none,
      sizing: StackFit.expand,
      index: fullScreenWidget == null ? 0 : 1,
      children: [
        child,

        if (fullScreenWidget != null)
          Padding(
            padding: const AppEdgeInsets.normal(),
            child: fullScreenWidget
          )
      ]
    );
  }
}

class _Notifier extends InheritedNotifier<ValueNotifier<Widget?>> {
  _Notifier({
    required super.notifier,
    required super.child
  });
}