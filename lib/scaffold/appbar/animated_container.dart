import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_model.dart';

class AppbarAnimatedContainer extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget child;

  AppbarAnimatedContainer({
    this.margin,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    double height = AppbarModel.currentHeightOf(context);
    return AnimatedContainer(
      height: height,
      margin: margin,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}