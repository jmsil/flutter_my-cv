import 'dart:ui';

import 'package:flutter/material.dart';

import '../../scaffold/device.dart';
import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout_model.dart';

abstract class AppViewer extends StatefulWidget {
  final Axis windowDirection;
  final double? windowWidth;
  final double? windowHeight;
  final double? barSize;
  final EdgeInsets barPadding;
  final double? bodyAspectRatio;
  final bool isTransparentBody;

  AppViewer({
    required this.windowDirection,
    this.windowWidth,
    this.windowHeight,
    this.barSize,
    required this.barPadding,
    this.bodyAspectRatio,
    required this.isTransparentBody
  });

  @override
  AppViewerState createState();

  static void show(BuildContext context, AppViewer viewer) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: AppDevice.isMobileDevice(),
        barrierLabel: '',
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.7),
        transitionDuration: AppTheme.animationDuration,
        reverseTransitionDuration: AppTheme.animationDuration,

        transitionsBuilder: (transCtx, transAnim, transSecAnim, transChild) {
          return FadeUpwardsPageTransitionsBuilder().buildTransitions(
            null, transCtx, transAnim, transSecAnim, transChild
          );
        },

        pageBuilder: (pageCtx, pageAnim, pageSecAnim) => viewer
      )
    );
  }

  static void setFullWindowOf(BuildContext context, Widget? widget) {
    context.getInheritedWidgetOfExactType<_Notifier>()?.notifier?.value = widget;
  }
}

abstract class AppViewerState<T extends AppViewer> extends State<T> {
  final GlobalKey _builtWindowContentKey = GlobalKey();
  final GlobalKey _builtBarKey = GlobalKey();
  final GlobalKey _builtBodyRightToolbarKey = GlobalKey();
  final GlobalKey _builtBodyBottomToolbarKey = GlobalKey();
  final ValueNotifier<Widget?> _valueNotifier = ValueNotifier(null);

  bool _isCompactMode = false;
  bool get isCompactMode => _isCompactMode;

  bool get isWindowHorizontalDirection => widget.windowDirection == Axis.horizontal;
  bool get isWindowVerticalDirection => widget.windowDirection == Axis.vertical;

  late Axis _bodyDirection = widget.windowDirection;
  bool get isBodyHorizontalDirection => _bodyDirection == Axis.horizontal;
  bool get isBodyVerticalDirection => _bodyDirection == Axis.vertical;

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final Size screenSize = context.screenSize;
    final bool isMobileDevice = AppDevice.isMobileDevice();
    final bool isFloatingWindow =
      screenSize.width >= 720 && screenSize.height >= 480 && ! isMobileDevice;

    final bool showBarBackground =
      isWindowVerticalDirection && layout.showTopbarBackground
      ||
      isWindowHorizontalDirection && layout.showSidebarBackground;

    final Color barBackgroundColor = showBarBackground
      ? theme.elementColor1
      : theme.backgroundColor;

    final Widget builtBarWidget = Offstage(
      offstage: _isCompactMode,
      child: AppContainer(
        key: _builtBarKey,
        width: isWindowHorizontalDirection ? widget.barSize : null,
        height: isWindowVerticalDirection ? widget.barSize : null,
        padding: widget.barPadding,
        color: isMobileDevice
          ? barBackgroundColor
          : barBackgroundColor.withValues(alpha: 0.6),
        child: buildBar(showBarBackground)
      )
    );

    final Widget builtFullBodyWidget = LayoutBuilder(
      builder: (BuildContext fullBodyContext, BoxConstraints fullBodyConstraints) {
        Widget builtBodyWidget = LayoutBuilder(
          builder: (BuildContext bodyContext, BoxConstraints bodyConstraints) {
            return _Notifier(
              notifier: _valueNotifier,
              child: _IndexedStack(
                child: buildBody(bodyConstraints.maxWidth, bodyConstraints.maxHeight)
              )
            );
          }
        );

        final Widget? builtBodyRightToolbarWidget =
          buildBodyRightToolbar(fullBodyConstraints.maxHeight);
        final Widget? builtBodyBottomToolbarWidget =
          buildBodyBottomToolbar(fullBodyConstraints.maxWidth);

        if (builtBodyRightToolbarWidget != null) {
          builtBodyWidget = Row(
            children: [
              Expanded(child: builtBodyWidget),
              Offstage(
                offstage: isBodyVerticalDirection,
                child: KeyedSubtree(
                  key: _builtBodyRightToolbarKey,
                  child: builtBodyRightToolbarWidget
                )
              )
            ]
          );
        }

        if (builtBodyBottomToolbarWidget != null) {
          builtBodyWidget = Column(
            children: [
              Expanded(child: builtBodyWidget),
              Offstage(
                offstage: isBodyHorizontalDirection,
                child: KeyedSubtree(
                  key: _builtBodyBottomToolbarKey,
                  child: builtBodyBottomToolbarWidget
                )
              )
            ]
          );
        }

        return builtBodyWidget;
      }
    );

    Widget builtWindowContentWidget = Flex(
      direction: widget.windowDirection,
      children: [
        builtBarWidget,
        Expanded(
          child: AppContainer(
            color: widget.isTransparentBody && ! isMobileDevice
              ? theme.backgroundColor.withValues(alpha: 0.88)
              : theme.backgroundColor,
            child: builtFullBodyWidget
          )
        )
      ]
    );

    if ( ! isMobileDevice) {
      builtWindowContentWidget = BackdropFilter(
        key: _builtWindowContentKey,
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: builtWindowContentWidget
      );
    }

    WidgetsBinding.instance.addPostFrameCallback(_setCompactModeAndBodyDirection);

    return isFloatingWindow
      ? Center(
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
            child: builtWindowContentWidget
          )
        )
      : builtWindowContentWidget;
  }

  void _setCompactModeAndBodyDirection(Duration timeStamp) {
    final Size barSize = _builtBarKey.currentContext?.size ?? Size.zero;
    final Size? rightToolbarSize = _builtBodyRightToolbarKey.currentContext?.size;
    final Size? bottomToolbarSize = _builtBodyBottomToolbarKey.currentContext?.size;
    final Size windowContentSize = _builtWindowContentKey.currentContext?.size ?? Size.zero;

    final bool newIsCompactMode =
      (isWindowHorizontalDirection ? barSize.width : barSize.height) /
      (isWindowHorizontalDirection ? windowContentSize.width : windowContentSize.height) > 0.3;

    final double fullBodyWidth =
      windowContentSize.width -
      (isWindowHorizontalDirection && ! newIsCompactMode ? barSize.width : 0);

    final double fullBodyHeight =
      windowContentSize.height -
      (isWindowVerticalDirection && ! newIsCompactMode ? barSize.height : 0);

    Axis newBodyDirection = _bodyDirection;

    if (widget.bodyAspectRatio != null) {
      double bodyWidth = fullBodyWidth - (rightToolbarSize?.width ?? 0);
      double bodyHeight = fullBodyHeight - (bottomToolbarSize?.height ?? 0);

      if (
        bodyWidth / fullBodyHeight < widget.bodyAspectRatio! &&
        bottomToolbarSize != null
      )
        newBodyDirection = Axis.vertical;

      else if (
        fullBodyWidth / bodyHeight > widget.bodyAspectRatio! &&
        rightToolbarSize != null
      )
        newBodyDirection = Axis.horizontal;
    }
    else {
      double rightToolbarRatio = (rightToolbarSize?.width ?? double.infinity) / fullBodyWidth;
      double bottomToolbarRatio = (bottomToolbarSize?.height ?? double.infinity) / fullBodyHeight;

      newBodyDirection = rightToolbarRatio < bottomToolbarRatio
        ? Axis.horizontal
        : Axis.vertical;
    }

    if (newIsCompactMode != _isCompactMode || newBodyDirection != _bodyDirection) {
      setState(() {
        _isCompactMode = newIsCompactMode;
        _bodyDirection = newBodyDirection;
      });
    }
  }

  Widget buildBar(bool showBackground);

  Widget buildBody(double width, double height);

  Widget? buildBodyRightToolbar(double width) => null;

  Widget? buildBodyBottomToolbar(double height) => null;
}

class _IndexedStack extends StatelessWidget {
  final child;

  _IndexedStack({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Widget? fullWindowWidget =
      context.dependOnInheritedWidgetOfExactType<_Notifier>()?.notifier?.value;

    return IndexedStack(
      clipBehavior: Clip.none,
      sizing: StackFit.expand,
      index: fullWindowWidget == null ? 0 : 1,
      children: [
        child,

        if (fullWindowWidget != null)
          Padding(
            padding: const AppEdgeInsets.normal(),
            child: fullWindowWidget
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