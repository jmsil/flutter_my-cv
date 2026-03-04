import 'package:flutter/widgets.dart';

import '../../ui/theme.dart';
import 'state_provider.dart';

class AppbarAnimatedPadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  AppbarAnimatedPadding({
    required this.padding,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding =
      context.dependOnInheritedWidgetOfExactType<AppbarStateProvider>()!.currentTotalHeight;

    return AnimatedPadding(
      padding: padding.copyWith(top: topPadding),
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}