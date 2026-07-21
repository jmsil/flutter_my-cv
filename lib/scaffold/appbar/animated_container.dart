import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_provider.dart';

class AppbarAnimatedContainer extends StatelessWidget {
  final Widget child;

  AppbarAnimatedContainer(this.child);

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = AppbarProvider.marginOf(context);
    double height = AppbarProvider.currentHeightOf(context);
    return AnimatedContainer(
      height: height,
      margin: margin,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}