import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppListView extends ListView {
  AppListView({
    super.controller,
    super.padding,
    super.children
  }) : super(
    key: controller != null ? PageStorageKey(controller.debugLabel) : null,
    primary: false,
    scrollCacheExtent: ScrollCacheExtent.pixels(double.infinity),
    addRepaintBoundaries: false,
    addAutomaticKeepAlives: false,
    physics: AlwaysScrollableScrollPhysics()
  );
}

class AppCustomScrollView extends CustomScrollView {
  AppCustomScrollView(
    List<Widget> slivers
  ) : super(
    primary: false,
    scrollCacheExtent: ScrollCacheExtent.pixels(double.infinity),
    physics: AlwaysScrollableScrollPhysics(),
    slivers: slivers
  );
}

class AppScrollBehavior extends ScrollBehavior {
  static const ScrollPhysics _physics = BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => _physics;

  @override
  Set<PointerDeviceKind> get dragDevices {
    Set<PointerDeviceKind> newSet = {};
    newSet.addAll(super.dragDevices);
    newSet.add(PointerDeviceKind.mouse);
    return newSet;
  }
}