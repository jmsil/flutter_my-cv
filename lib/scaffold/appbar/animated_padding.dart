import 'package:flutter/widgets.dart';

import '../../ui/layout/theme.dart';
import 'appbar_provider.dart';

class AppbarAnimatedPadding extends StatelessWidget {
  final EdgeInsets padding;
  final double topFactor;
  final double bottomFactor;
  final Widget child;

  AppbarAnimatedPadding({
    required this.padding,
    this.topFactor = 1,
    this.bottomFactor = 0,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    final double deltaHeight =
      AppbarProvider.currentTotalHeightOf(context) -
      AppbarProvider.totalCollapsedHeightOf(context);

    return AnimatedPadding(
      padding: padding.copyWith(
        top: padding.top + deltaHeight * topFactor,
        bottom: padding.bottom + deltaHeight * bottomFactor
      ),
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      child: child
    );
  }
}