import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_model.dart';

class AppbarAnimatedOpacity extends StatelessWidget {
  final Widget child;

  AppbarAnimatedOpacity(this.child);

  @override
  Widget build(BuildContext context) {
    bool isExpanded = AppbarModel.currentValueOf(context);
    return AnimatedOpacity(
      opacity: isExpanded ? 0 : 1,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}