import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';

export 'animated_container.dart';
export 'animated_opacity.dart';
export 'animated_padding.dart';

enum AppbarModelState {
  collapsed, expanded;
  bool get isCollapsed => this == collapsed;
}

class AppbarModel extends StatefulWidget {
  static const double collapsedHeight = 226;

  final Widget child;

  AppbarModel(this.child);

  @override
  _State createState() => _State();

  static AppbarModelState currentStateOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppbarModelNotifier>()!.notifier!.value;
  }

  static EdgeInsets marginOf(BuildContext context) {
    return context.appLayout.isFullLayout
      ? const AppEdgeInsets.normal(right: 0, bottom: 0) : EdgeInsets.zero;
  }

  static double totalCollapsedHeightOf(BuildContext context) {
    return collapsedHeight + marginOf(context).vertical;
  }

  static double currentHeightOf(BuildContext context) {
    return currentStateOf(context).isCollapsed
      ? AppbarModel.collapsedHeight
      : AppLayout.sidebarWidth - AppDimens.normal * 2;
  }

  static double currentTotalHeightOf(BuildContext context) {
    return currentHeightOf(context) + marginOf(context).vertical;
  }

  static void switchStateOf(BuildContext context) {
    context.getInheritedWidgetOfExactType<_AppbarModelNotifier>()!.switchState();
  }
}

class _State extends State<AppbarModel> {
  final ValueNotifier<AppbarModelState> notifier = ValueNotifier(AppbarModelState.collapsed);

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppbarModelNotifier(
      notifier: this.notifier,
      child: widget.child
    );
  }
}

class _AppbarModelNotifier extends InheritedNotifier<ValueNotifier<AppbarModelState>> {
  _AppbarModelNotifier({
    required super.notifier,
    required super.child
  });

  void switchState() {
    notifier!.value = notifier!.value.isCollapsed
      ? AppbarModelState.expanded : AppbarModelState.collapsed;
  }
}