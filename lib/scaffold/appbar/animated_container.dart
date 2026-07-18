import 'package:flutter/widgets.dart';

import '../../ui/layout/layout_provider.dart';
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
      duration: LayoutProvider.theme.animationDuration,
      curve: LayoutProvider.theme.animationCurve,
      child: child
    );
  }
}