import 'package:flutter/material.dart';

import 'theme.dart';

class AppDivider extends Divider {
  AppDivider([double thickness = 2])
    :
    super(
      height: 8,
      thickness: thickness,
      color: AppTheme.lightBlue.withValues(alpha: 0.36)
    );
}