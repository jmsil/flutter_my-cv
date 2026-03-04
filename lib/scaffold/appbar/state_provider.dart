import 'package:flutter/widgets.dart';

import '../../ui/theme.dart';
import '../sidebar.dart';
import 'desktop.dart';

class AppbarStateProvider extends InheritedNotifier<ValueNotifier<bool>> {
  static const double collapsedHeight = 230;
  static final double totalCollapsedHeight = collapsedHeight + DesktopAppbar.margin.vertical;
  static const double expandedHeight =
    AppSidebar.containerWidth - ThemedEdgeInsets.normalValue * 2;

  AppbarStateProvider({
    required super.child
  })
    : super(
        notifier: ValueNotifier<bool>(false)
      );

  void _switchState() {
    bool currentState = notifier?.value ?? false;
    notifier?.value = !currentState;
  }

  double get _currentHeight {
    bool currentState = notifier?.value ?? false;
    return currentState ? expandedHeight : collapsedHeight;
  }

  double get _currentTotalHeight {
    return _currentHeight + DesktopAppbar.margin.vertical;
  }



  static double currentHeightOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppbarStateProvider>()!._currentHeight;
  }

  static double currentTotalHeightOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppbarStateProvider>()!._currentTotalHeight;
  }

  static void switchStateOf(BuildContext context) {
    context.getInheritedWidgetOfExactType<AppbarStateProvider>()!._switchState();
  }
}