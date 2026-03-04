import 'package:flutter/material.dart';
import 'package:my_cv/ui/theme.dart';

import 'const.dart';

class AppDivider extends Divider {
  AppDivider(double thickness)
    : super(
        thickness: thickness,
        color: AppTheme.lightBlue.withValues(alpha: 0.24),
        radius: AppUiConst.circleBorderRadius
      );
}