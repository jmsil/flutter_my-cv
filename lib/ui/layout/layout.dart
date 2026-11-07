import 'package:flutter/material.dart';

import 'theme.dart';

class AppLayout {
  static const double sidebarWidth = 480;
  static final AppTheme _defaultTheme = AppTheme();
  static final AppTheme _noSidebarTheme = AppTheme(
    sidebarSection: AppThemeData(
      surfaceColor: Colors.blueGrey[900]!.withValues(alpha: 0.12),
      over1: AppThemeDataStyledProperty(Colors.black),
      over2: AppThemeDataStyledProperty(Colors.blueGrey[900]!),
      decoration: AppThemeDataStyledProperty(Colors.blue[900]!)
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

  final bool showTopbarBackground;
  final bool showSidebarBackground;
  final AppTheme theme;

  bool get isFlatLayout => ! showTopbarBackground && ! showSidebarBackground;
  bool get isLeftLayout => ! showTopbarBackground && showSidebarBackground;
  bool get isFullLayout => showTopbarBackground && showSidebarBackground;

  AppLayout({
    required this.showTopbarBackground,
    required this.showSidebarBackground,
    required this.theme
  });
}