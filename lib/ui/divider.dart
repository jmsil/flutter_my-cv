import 'package:material_ui/material_ui.dart';

import 'layout/theme.dart';

class AppDivider extends Divider {
  static const double heightFactor = 4;

  AppDivider(
    double thickness, Color color
  ) : super(
    thickness: thickness,
    height: thickness * heightFactor,
    color: color.withDividerAlpha,
    radius: AppTheme.circleBorderRadius
  );
}