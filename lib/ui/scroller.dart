import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppListView extends ListView {
  AppListView({
    EdgeInsets padding = EdgeInsets.zero,
    required List<Widget> children
  })
    : super(
        primary: false,
        cacheExtent: double.infinity,
        padding: padding,
        children: children
      );
}

class AppSliverScroller extends CustomScrollView {
  AppSliverScroller(List<Widget> slivers)
    : super(
        primary: false,
        cacheExtent: double.infinity,
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