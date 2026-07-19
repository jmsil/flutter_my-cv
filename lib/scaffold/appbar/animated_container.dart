import 'package:flutter/widgets.dart';

import '../../ui/theme/theme.dart';
import 'state_provider.dart';

class AppbarAnimatedContainer extends StatelessWidget {
  final Widget child;

  AppbarAnimatedContainer({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final double height = AppbarStateProvider.currentHeightOf(context);
    return AnimatedContainer(
      height: height,
      margin: AppbarStateProvider.margin,
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}