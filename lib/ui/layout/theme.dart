import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusValue = 16;
  static const Radius radius = Radius.circular(radiusValue);
  static const Radius circleRadius = Radius.circular(999);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);
  static const BorderRadius circleBorderRadius = BorderRadius.all(circleRadius);

  static const Curve animationCurve = Curves.decelerate;
  static const Duration animationDuration = Duration(milliseconds: 380);

  AppTheme({
    AppThemeData? background,
    AppThemeData? brand1,
    AppThemeData? brand2,
    AppThemeData? brand3,
    AppThemeData? sidebarSection
  }) :
    this.background = background ?? AppThemeData(
      surfaceColor: Colors.blueGrey[50]!,
      over1: AppThemeDataStyledProperty(Colors.black),
      over2: AppThemeDataBasicProperty(Colors.white),
      decoration: AppThemeDataStyledProperty(Colors.blue[900]!)
    ),
    this.brand1 = brand1 ?? AppThemeData(
      surfaceColor: Colors.blueGrey[900]!,
      over1: AppThemeDataStyledProperty(Colors.blue[200]!)
    ),
    this.brand2 = brand2 ?? AppThemeData(
      surfaceColor: Colors.blueGrey[700]!,
      over1: AppThemeDataStyledProperty(Colors.blue[100]!),
      over2: AppThemeDataBasicProperty(Colors.blueGrey[200]!)
    ),
    this.sidebarSection = sidebarSection ?? AppThemeData(
      surfaceColor: Colors.black26,
      over1: AppThemeDataStyledProperty(Colors.blue[100]!),
      over2: AppThemeDataStyledProperty(Colors.blue[200]!),
      decoration: AppThemeDataStyledProperty(Colors.blue[200]!)
    );

  final AppThemeData background;
  final AppThemeData brand1;
  final AppThemeData brand2;
  final AppThemeData sidebarSection;
}

class AppThemeTextStyle {
  final TextStyle regular;
  final TextStyle bold;
  final TextStyle italic;

  AppThemeTextStyle(
    double fontSize, Color color
  ) :
    this.regular = TextStyle(fontSize: fontSize, color: color),
    this.bold = TextStyle(fontSize: fontSize, color: color, fontWeight: FontWeight.bold),
    this.italic = TextStyle(fontSize: fontSize, color: color, fontStyle: FontStyle.italic);
}

class AppThemeDataBasicProperty {
  static const AppThemeDataBasicProperty transparent = AppThemeDataBasicProperty(
    Colors.transparent);
  final Color color;
  const AppThemeDataBasicProperty(this.color);
}

class AppThemeDataStyledProperty extends AppThemeDataBasicProperty {
  final AppThemeTextStyle normalHeader;
  final AppThemeTextStyle normalText;
  final AppThemeTextStyle largeHeader;
  final AppThemeTextStyle largeText;
  final AppThemeTextStyle xLargeHeader;
  final AppThemeTextStyle xLargeText;

  AppThemeDataStyledProperty(
    super.color
  ) :
    this.normalHeader = AppThemeTextStyle(16, color),
    this.normalText = AppThemeTextStyle(15, color),
    this.largeHeader = AppThemeTextStyle(18, color),
    this.largeText = AppThemeTextStyle(17, color),
    this.xLargeHeader = AppThemeTextStyle(20, color),
    this.xLargeText = AppThemeTextStyle(18, color);
}

class AppThemeData {
  AppThemeData({
    required this.surfaceColor,
    this.over1 = AppThemeDataBasicProperty.transparent,
    this.over2 = AppThemeDataBasicProperty.transparent,
    this.decoration = AppThemeDataBasicProperty.transparent
  });

  final Color surfaceColor;

  final AppThemeDataBasicProperty over1;
  AppThemeDataStyledProperty get overStyled1 => over1 as AppThemeDataStyledProperty;

  final AppThemeDataBasicProperty over2;
  AppThemeDataStyledProperty get overStyled2 => over2 as AppThemeDataStyledProperty;

  final AppThemeDataBasicProperty decoration;
  AppThemeDataStyledProperty get decorationStyled => decoration as AppThemeDataStyledProperty;
}

extension AppThemeColorExtension on Color {
  Color get withInkEffectAlpha => this.withValues(alpha: 0.12);
  Color get withButtonFrameAlpha => this.withValues(alpha: 0.16);
  Color get withDividerAlpha => this.withValues(alpha: 0.24);
  Color get withWindowBorderAlpha => this.withValues(alpha: 0.36);
  Color get withDecorationAlpha => this.withValues(alpha: 0.16);
  Color get withDarkDecorationAlpha => this.withValues(alpha: 0.32);
  Color get withTextSelectionAlpha => this.withValues(alpha: 0.32);
  Color get withCardFillAlpha => this.withValues(alpha: 0.12);
  Color get withCardBorderAlpha => this.withValues(alpha: 0.48);
}