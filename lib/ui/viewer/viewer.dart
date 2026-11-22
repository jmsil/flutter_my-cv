import 'dart:math';
import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import '../container.dart';
import '../layout/device.dart';
import '../layout/dimens.dart';
import '../layout/layout_model.dart';

enum AppViewerMode {
  expanded, compactWithBar, compactNoBar;

  bool get isExpanded => this == expanded;
  bool get isCompactNoBar => this == compactNoBar;
  bool get isCompactMode => this == compactWithBar || this == compactNoBar;
}

abstract class AppViewer extends StatefulWidget {
  final Axis direction;
  final double? width;
  final double? height;
  final double maxBarRatio;
  final double? bodyAspectRatio;

  AppViewer({
    required this.direction,
    this.width,
    this.height,
    required this.maxBarRatio,
    this.bodyAspectRatio
  });

  @override
  AppViewerState createState();

  static void show(BuildContext context, AppViewer viewer) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: AppDevice.isMobileDevice(),
        barrierLabel: '',
        barrierDismissible: true,
        barrierColor: Colors.black.withViewerBackgroundAlpha,
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
  final GlobalKey _windowContentKey = GlobalKey();
  final GlobalKey _barKey = GlobalKey();
  final GlobalKey _compactBarKey = GlobalKey();
  final GlobalKey _bodyRightToolbarKey = GlobalKey();
  final GlobalKey _bodyBottomToolbarKey = GlobalKey();
  final ValueNotifier<Widget?> _valueNotifier = ValueNotifier(null);

  AppViewerMode _mode = AppViewerMode.expanded;
  AppViewerMode get mode => _mode;

  bool get isWindowHorizontalDirection => widget.direction == Axis.horizontal;
  bool get isWindowVerticalDirection => widget.direction == Axis.vertical;

  Axis _bodyDirection = Axis.vertical;
  bool get isBodyHorizontalDirection => _bodyDirection == Axis.horizontal;
  bool get isBodyVerticalDirection => _bodyDirection == Axis.vertical;

  @override
  void initState() {
    super.initState();
    _bodyDirection = widget.direction;
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobileDevice = AppDevice.isMobileDevice();
    final AppThemeData themeData = LayoutModel.theme.viewer;
    final bool isFullWindowMode = isMobileDevice || _getIsFullWindowMode();

    final Widget builtBarWidget = LayoutBuilder(
      builder: (BuildContext barContext, BoxConstraints barConstraints) {
        final Widget? builtCompactModeBarWidget = buildCompactModeBar(
          themeData, barConstraints.maxWidth, barConstraints.maxHeight);
        Widget builtBarWidget = _Offstage(
          _barKey, _mode.isCompactMode,
          buildBar(themeData, barConstraints.maxWidth, barConstraints.maxHeight)
        );

        if (builtCompactModeBarWidget != null) {
          builtBarWidget = Stack(
            clipBehavior: Clip.none,
            children: [
              builtBarWidget,
              _Offstage(_compactBarKey, _mode.isExpanded, builtCompactModeBarWidget)
            ]
          );
        }

        builtBarWidget = AppContainer(
          color: isMobileDevice
            ? themeData.surfaceColor1
            : themeData.surfaceColor1.withViewerBarAlpha,
          borderRadius: isFullWindowMode
            ? null
            : isWindowHorizontalDirection ? AppTheme.leftBorderRadius : AppTheme.topBorderRadius,
          child: builtBarWidget
        );

        return isMobileDevice
          ? builtBarWidget
          : ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: builtBarWidget
              )
            );
      }
    );

    final Widget builtFullBodyWidget = LayoutBuilder(
      builder: (BuildContext fullBodyContext, BoxConstraints fullBodyConstraints) {

        Widget builtBodyWidget = LayoutBuilder(
          builder: (BuildContext bodyContext, BoxConstraints bodyConstraints) {
            return _Notifier(
              notifier: _valueNotifier,
              child: _IndexedStack(
                child: buildBody(
                  themeData, bodyConstraints.maxWidth, bodyConstraints.maxHeight
                )
              )
            );
          }
        );

        final Widget? builtBodyRightToolbarWidget = buildBodyRightToolbar(
          themeData, fullBodyConstraints.maxHeight);
        final Widget? builtBodyBottomToolbarWidget = buildBodyBottomToolbar(
          themeData, fullBodyConstraints.maxWidth);

        if (builtBodyRightToolbarWidget != null) {
          builtBodyWidget = Row(
            children: [
              Expanded(child: builtBodyWidget),
              _Offstage(
                _bodyRightToolbarKey, isBodyVerticalDirection, builtBodyRightToolbarWidget
              )
            ]
          );
        }

        if (builtBodyBottomToolbarWidget != null) {
          builtBodyWidget = Column(
            children: [
              Expanded(child: builtBodyWidget),
              _Offstage(
                _bodyBottomToolbarKey, isBodyHorizontalDirection, builtBodyBottomToolbarWidget
              )
            ]
          );
        }

        return builtBodyWidget;
      }
    );

    final Widget builtWindowContentWidget = Flex(
      key: _windowContentKey,
      direction: widget.direction,
      children: [
        builtBarWidget,
        Expanded(
          child: AppContainer(
            color: themeData.surfaceColor1,
            borderRadius: isFullWindowMode
              ? null
              : _mode.isCompactNoBar
                ? AppTheme.allBorderRadius
                : isWindowHorizontalDirection
                  ? AppTheme.rightBorderRadius : AppTheme.bottomBorderRadius,
            child: builtFullBodyWidget
          )
        )
      ]
    );

    WidgetsBinding.instance.addPostFrameCallback(_setCompactModeAndBodyDirection);

    return isFullWindowMode
      ? builtWindowContentWidget
      : Center(
          child: AppContainer(
            width: widget.width,
            height: widget.height,
            margin: const AppEdgeInsets.normal(),
            child: builtWindowContentWidget
          )
        );
  }

  bool _getIsFullWindowMode() {
    final Size screenSize = context.screenSize;
    final double looseWidth = widget.width ?? double.infinity;
    final double looseHeight = widget.height ?? double.infinity;
    return
      screenSize.width <= max(min(1024, looseWidth), (widget.width ?? 0) * 0.75) &&
        screenSize.height <= looseHeight ||
      screenSize.height <= max(min(1024, looseHeight), (widget.height ?? 0) * 0.75) &&
        screenSize.width <= looseWidth;
  }

  void _setCompactModeAndBodyDirection(Duration timeStamp) {
    final Size barSize = _barKey.currentContext?.size ?? Size.zero;
    final Size? compactBarSize = _compactBarKey.currentContext?.size;
    final Size? rightToolbarSize = _bodyRightToolbarKey.currentContext?.size;
    final Size? bottomToolbarSize = _bodyBottomToolbarKey.currentContext?.size;
    final Size windowContentSize = _windowContentKey.currentContext?.size ?? Size.zero;

    final bool newIsCompactMode =
      (isWindowHorizontalDirection ? barSize.width : barSize.height) /
      (isWindowHorizontalDirection ? windowContentSize.width : windowContentSize.height) >
      widget.maxBarRatio;

    final AppViewerMode newMode = newIsCompactMode
      ? compactBarSize == null
        ? AppViewerMode.compactNoBar : AppViewerMode.compactWithBar
      : AppViewerMode.expanded;

    final double fullBodyWidth =
      windowContentSize.width - (isWindowHorizontalDirection
        ? newMode.isExpanded ? barSize.width : compactBarSize?.width ?? 0
        : 0
      );

    final double fullBodyHeight =
      windowContentSize.height - (isWindowVerticalDirection
        ? newMode.isExpanded ? barSize.height : compactBarSize?.height ?? 0
        : 0
      );

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

    if (newMode != _mode || newBodyDirection != _bodyDirection) {
      setState(() {
        _mode = newMode;
        _bodyDirection = newBodyDirection;
      });
    }
  }

  Widget buildBar(AppThemeData themeData, double width, double height);

  Widget? buildCompactModeBar(AppThemeData themeData, double width, double height) => null;

  Widget buildBody(AppThemeData themeData, double width, double height);

  Widget? buildBodyRightToolbar(AppThemeData themeData, double height) => null;

  Widget? buildBodyBottomToolbar(AppThemeData themeData, double width) => null;
}

class _Offstage extends Offstage {
  _Offstage(
    Key key, bool offstage,Widget child
  ) : super(
    offstage: offstage,
    child: KeyedSubtree(key: key, child: child)
  );
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