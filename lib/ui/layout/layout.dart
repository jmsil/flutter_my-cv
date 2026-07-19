import 'package:flutter/widgets.dart';

import 'theme.dart';

class AppLayout {
  static final AppLayout flat = AppLayout(
    theme: AppTheme.flat,
    hasTopbar: false,
    hasSidebar: false
  );

  static final AppLayout left = AppLayout(
    theme: AppTheme.left,
    hasTopbar: false,
    hasSidebar: true
  );

  static final AppLayout top = AppLayout(
    theme: AppTheme.top,
    hasTopbar: true,
    hasSidebar: false
  );

  static final AppLayout full = AppLayout(
    theme: AppTheme.full,
    hasTopbar: true,
    hasSidebar: true
  );

  static const double shortSpacing = 2;
  static const double smallSpacing = 8;
  static const double normalSpacing = 16;
  static const double largeSpacing = 24;
  static const double xLargeSpacing = 32;

  static const SizedBox shortVerticalSpacer = SizedBox(height: shortSpacing);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpacing);
  static const SizedBox normalVerticalSpacer = SizedBox(height: normalSpacing);

  final AppTheme theme;
  final bool hasTopbar;
  final bool hasSidebar;

  AppLayout({
    required this.theme,
    required this.hasTopbar,
    required this.hasSidebar
  });
}