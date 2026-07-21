import 'package:flutter/widgets.dart';

import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_provider.dart';

export 'animated_container.dart';
export 'animated_opacity.dart';
export 'animated_padding.dart';

class AppbarProvider extends StatefulWidget {
  static const double collapsedHeight = 226;
  static const EdgeInsets _marginSidebar = AppEdgeInsets.normal(right: 0);
  static const EdgeInsets _marginNoSidebar = EdgeInsets.only(bottom: AppEdgeInsets.normalValue);

  final Widget child;

  AppbarProvider(this.child);

  @override
  _State createState() => _State();

  static bool currentValueOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_Notifier>()!.currentValue;
  }

  static EdgeInsets marginOf(BuildContext context) {
    return context.appLayout.hasSidebar ? _marginSidebar : _marginNoSidebar;
  }

  static double totalCollapsedHeightOf(BuildContext context) {
    return collapsedHeight + marginOf(context).vertical;
  }

  static double currentHeightOf(BuildContext context) {
    return currentValueOf(context)
      ? AppLayout.sidebarWidth - AppEdgeInsets.normalValue * 2
      : AppbarProvider.collapsedHeight;
  }

  static double currentTotalHeightOf(BuildContext context) {
    return currentHeightOf(context) + marginOf(context).vertical;
  }

  static void switchStateOf(BuildContext context) {
    context.getInheritedWidgetOfExactType<_Notifier>()!.switchState();
  }
}

class _State extends State<AppbarProvider> {
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
    notifier?.value = ! currentValue;
  }

  bool get currentValue {
    return notifier?.value ?? false;
  }
}