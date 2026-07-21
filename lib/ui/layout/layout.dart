import 'package:flutter/material.dart';

import 'theme.dart';

class AppLayout {
  static final AppLayout flat = AppLayout(
    hasTopbar: false,
    hasSidebar: false,
    theme: AppTheme(
      overElement1Color1: Colors.black,
      sectionColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      overSectionColor1: Colors.black,
      overSectionColor2: Colors.black,
      overSectionColor3: Colors.blue[900]
    )
  );

  static final AppLayout left = AppLayout(
    hasTopbar: false,
    hasSidebar: true,
    theme: AppTheme(
      text2FontSize: 18,
      header2FontSize: 20
    )
  );

  static final AppLayout top = AppLayout(
    hasTopbar: true,
    hasSidebar: false,
    theme: AppTheme(
      sectionColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      overSectionColor1: Colors.black,
      overSectionColor2: Colors.black,
      overSectionColor3: Colors.blue[900]
    )
  );

  static final AppLayout full = AppLayout(
    hasTopbar: true,
    hasSidebar: true,
    theme: AppTheme()
  );

  static const double tinySpacing = 2;
  static const double shortSpacing = 4;
  static const double smallSpacing = 8;
  static const double normalSpacing = 16;
  static const double largeSpacing = 24;
  static const double xLargeSpacing = 32;

  static const SizedBox tinyVerticalSpacer = SizedBox(height: tinySpacing);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpacing);
  static const SizedBox normalVerticalSpacer = SizedBox(height: normalSpacing);

  final bool hasTopbar;
  final bool hasSidebar;
  final AppTheme theme;

  bool get isLeftLayout => ! hasTopbar && hasSidebar;

  AppLayout({
    required this.hasTopbar,
    required this.hasSidebar,
    required this.theme
  });
}