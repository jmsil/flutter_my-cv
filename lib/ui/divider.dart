import 'package:flutter/material.dart';
import 'package:my_cv/ui/layout/theme.dart';

class AppDivider extends Divider {
  static const double heightFactor = 4;

  AppDivider(AppTheme theme, double thickness)
    : super(
        thickness: thickness,
        height: thickness * heightFactor,
        color: theme.overElement1Color1.withValues(alpha: 0.24),
        radius: AppTheme.circleBorderRadius
      );
}