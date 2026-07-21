import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'state_provider.dart';

class AppbarAnimatedOpacity extends StatelessWidget {
  final Widget child;

  AppbarAnimatedOpacity(this.child);

  @override
  Widget build(BuildContext context) {
    final bool isExpanded = AppbarStateProvider.currentIsExpandedOf(context);
    return AnimatedOpacity(
      opacity: isExpanded ? 0 : 1,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}