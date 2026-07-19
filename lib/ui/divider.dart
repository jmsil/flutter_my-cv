import 'package:flutter/material.dart';

import 'const.dart';
import 'layout/layout_provider.dart';

class AppDivider extends Divider {
  static const double heightFactor = 4;

  AppDivider(double thickness)
    : super(
        thickness: thickness,
        height: thickness * heightFactor,
        color: LayoutProvider.theme.overElement1Color1.withValues(alpha: 0.24),
        radius: AppUiConst.circleBorderRadius
      );
}