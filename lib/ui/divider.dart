import 'package:material_ui/material_ui.dart';

import 'layout/theme.dart';

class AppDivider extends Divider {
  static const double sizeFactor = 4;

  AppDivider(
    double thickness, Color color
  ) : super(
    thickness: thickness,
    height: thickness * sizeFactor,
    color: color.withMidDecorationAlpha,
    radius: AppTheme.circleBorderRadius
  );
}

class AppVerticalDivider extends VerticalDivider {
  AppVerticalDivider(
    double thickness, Color color
  ) : super(
    thickness: thickness,
    width: thickness,
    color: color.withMidDecorationAlpha,
    radius: AppTheme.circleBorderRadius
  );
}