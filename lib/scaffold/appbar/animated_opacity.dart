import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_model.dart';

class AppbarAnimatedOpacity extends StatelessWidget {
  final Widget child;

  AppbarAnimatedOpacity(this.child);

  @override
  Widget build(BuildContext context) {
    bool isCollapsed = AppbarModel.currentStateOf(context).isCollapsed;
    return AnimatedOpacity(
      opacity: isCollapsed ? 1 : 0,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}