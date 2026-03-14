import 'package:flutter/material.dart';
import 'package:my_cv/ui/theme.dart';

import 'const.dart';

class AppDivider extends Divider {
  static const double heightFactor = 4;

  AppDivider(double thickness)
    : super(
        thickness: thickness,
        height: thickness * heightFactor,
        color: AppTheme.lightBlue.withValues(alpha: 0.24),
        radius: AppUiConst.circleBorderRadius
      );
}