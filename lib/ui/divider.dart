import 'package:flutter/material.dart';
import 'package:my_cv/ui/layout/theme.dart';

class AppDivider extends Divider {
  static const double heightFactor = 4;

  AppDivider(double thickness, Color color)
    : super(
        thickness: thickness,
        height: thickness * heightFactor,
        color: color.withValues(alpha: 0.24),
        radius: AppTheme.circleBorderRadius
      );
}