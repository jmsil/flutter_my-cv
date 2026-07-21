import 'package:flutter/material.dart';

import 'theme.dart';

class AppLayout {
  static final AppLayout flat = AppLayout(
    showTopbarBackground: false,
    showSidebarBackground: false,
    theme: AppTheme(
      sectionColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      overSectionColor1: Colors.black,
      overSectionColor2: Colors.black,
      overSectionColor3: Colors.blue[900]
    )
  );

  static final AppLayout left = AppLayout(
    showTopbarBackground: false,
    showSidebarBackground: true,
    theme: AppTheme(
      text2FontSize: 18,
      header2FontSize: 20
    )
  );

  static final AppLayout top = AppLayout(
    showTopbarBackground: true,
    showSidebarBackground: false,
    theme: AppTheme(
      sectionColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      overSectionColor1: Colors.black,
      overSectionColor2: Colors.black,
      overSectionColor3: Colors.blue[900]
    )
  );

  static final AppLayout full = AppLayout(
    showTopbarBackground: true,
    showSidebarBackground: true,
    theme: AppTheme()
  );

  static const double sidebarWidth = 480;

  static const double tinySpacing = 2;
  static const double shortSpacing = 4;
  static const double smallSpacing = 8;
  static const double normalSpacing = 16;
  static const double largeSpacing = 24;
  static const double xLargeSpacing = 32;

  static const SizedBox tinyVerticalSpacer = SizedBox(height: tinySpacing);
  static const SizedBox smallVerticalSpacer = SizedBox(height: smallSpacing);
  static const SizedBox normalVerticalSpacer = SizedBox(height: normalSpacing);

  final bool showTopbarBackground;
  final bool showSidebarBackground;
  final AppTheme theme;

  bool get isLeftLayout => showSidebarBackground && ! showTopbarBackground;

  AppLayout({
    required this.showTopbarBackground,
    required this.showSidebarBackground,
    required this.theme
  });
}