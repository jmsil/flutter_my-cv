import 'package:flutter/widgets.dart';

import '../../ui/theme.dart';
import '../sidebar.dart';
import 'desktop.dart';

class AppbarStateProvider extends InheritedNotifier<ValueNotifier<bool>> {
  static const double collapsedHeight = 230;
  static const double expandedHeight =
    AppSidebar.containerWidth - ThemedEdgeInsets.normalValue * 2;

  AppbarStateProvider({
    required super.child
  })
    : super(
        notifier: ValueNotifier<bool>(false)
      );

  void switchState() {
    bool currentState = notifier?.value ?? false;
    notifier?.value = !currentState;
  }

  double get currentHeight {
    bool currentState = notifier?.value ?? false;
    return currentState ? expandedHeight : collapsedHeight;
  }

  double get currentTotalHeight {
    return currentHeight + DesktopAppbar.margin.vertical;
  }
}