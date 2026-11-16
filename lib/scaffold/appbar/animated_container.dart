import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_model.dart';

class AppbarAnimatedContainer extends StatelessWidget {
  final Widget child;

  AppbarAnimatedContainer(this.child);

  @override
  Widget build(BuildContext context) {
    double height = AppbarModel.currentHeightOf(context);
    return AnimatedContainer(
      height: height,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}