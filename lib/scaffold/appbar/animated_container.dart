import 'package:flutter/widgets.dart';

import '../../ui/theme.dart';
import 'desktop.dart';
import 'state_provider.dart';

class AppbarAnimatedContainer extends StatelessWidget {
  final Widget child;

  AppbarAnimatedContainer({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final double height =
      context.dependOnInheritedWidgetOfExactType<AppbarStateProvider>()!.currentHeight;

    return AnimatedContainer(
      height: height,
      margin: DesktopAppbar.margin,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}