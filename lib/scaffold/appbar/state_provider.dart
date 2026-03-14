import 'package:flutter/widgets.dart';

import '../../ui/theme.dart';
import '../sidebar.dart';

class AppbarStateProvider extends StatefulWidget {
  static const EdgeInsets margin = ThemedEdgeInsets.normal(right: 0);
  static const double collapsedHeight = 226;
  static final double totalCollapsedHeight = collapsedHeight + margin.vertical;
  static const double expandedHeight =
    AppSidebar.containerWidth - ThemedEdgeInsets.normalValue * 2;

  final Widget child;

  AppbarStateProvider({
    required this.child
  });

  @override
  _State createState() => _State();



  static double currentHeightOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_Notifier>()!.currentHeight;
  }

  static double currentTotalHeightOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_Notifier>()!.currentTotalHeight;
  }

  static void switchStateOf(BuildContext context) {
    context.getInheritedWidgetOfExactType<_Notifier>()!.switchState();
  }
}


class _State extends State<AppbarStateProvider> {
  final ValueNotifier<bool> valueNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Notifier(
      notifier: valueNotifier,
      child: widget.child
    );
  }
}


class _Notifier extends InheritedNotifier<ValueNotifier<bool>> {
  _Notifier({
    required super.notifier,
    required super.child
  });

  void switchState() {
    bool currentState = notifier?.value ?? false;
    notifier?.value = !currentState;
  }

  double get currentHeight {
    bool currentState = notifier?.value ?? false;
    return currentState
      ? AppbarStateProvider.expandedHeight
      : AppbarStateProvider.collapsedHeight;
  }

  double get currentTotalHeight {
    return currentHeight + AppbarStateProvider.margin.vertical;
  }
}