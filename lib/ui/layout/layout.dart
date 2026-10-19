import 'package:flutter/material.dart';

import 'theme.dart';

class AppLayout {
  static final AppTheme _defaultTheme = AppTheme();
  static final AppTheme _noSidebarTheme = AppTheme(
    sidebarSection: AppThemeData(
      baseColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      overColor1: Colors.black,
      overColor2: Colors.blueGrey[900]!,
      decorationColor: Colors.blue[900]!
    )
  );

  static final AppLayout flat = AppLayout(
    showTopbarBackground: false,
    showSidebarBackground: false,
    theme: _noSidebarTheme
  );

  static final AppLayout left = AppLayout(
    showTopbarBackground: false,
    showSidebarBackground: true,
    theme: _defaultTheme
  );

  static final AppLayout top = AppLayout(
    showTopbarBackground: true,
    showSidebarBackground: false,
    theme: _noSidebarTheme
  );

  static final AppLayout full = AppLayout(
    showTopbarBackground: true,
    showSidebarBackground: true,
    theme: _defaultTheme
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