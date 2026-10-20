import 'package:flutter/material.dart';

class AppTheme {
  static const double normalHeaderFontSize = 16;
  static const double normalTextFontSize = 15;
  static const double largeHeaderFontSize = 18;
  static const double largeTextFontSize = 17;
  static const double xLargeHeaderFontSize = 20;
  static const double xLargeTextFontSize = 18;

  static const double radiusValue = 16;
  static const Radius radius = Radius.circular(radiusValue);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);

  static const Curve animationCurve = Curves.decelerate;
  static const Duration animationDuration = Duration(milliseconds: 380);

  static const BorderRadius circleBorderRadius = BorderRadius.all(Radius.circular(999));

  AppTheme({
    AppThemeData? background,
    AppThemeData? brand1,
    AppThemeData? brand2,
    AppThemeData? brand3,
    AppThemeData? sidebarSection
  }) :
    this.background = background ?? AppThemeData(
      baseColor: Colors.blueGrey[50]!,
      overColor1: Colors.black,
      overColor2: Colors.white,
      decorationColor: Colors.blue[900]!
    ),
    this.brand1 = brand1 ?? AppThemeData(
      baseColor: Colors.blueGrey[900]!,
      overColor1: Colors.blue[200]!
    ),
    this.brand2 = brand2 ?? AppThemeData(
      baseColor: Colors.blueGrey[700]!,
      overColor1: Colors.blueGrey[50]!
    ),
    this.brand3 = brand3 ?? AppThemeData(
      baseColor: Colors.blueGrey[200]!,
      overColor1: Colors.black
    ),
    this.sidebarSection = sidebarSection ?? AppThemeData(
      baseColor: Colors.black26,
      overColor1: Colors.blue[100]!,
      overColor2: Colors.blue[200]!,
      decorationColor: Colors.blue[200]!
    );

  final AppThemeData background;
  final AppThemeData brand1;
  final AppThemeData brand2;
  final AppThemeData brand3;
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

class AppThemeText {
  final AppThemeTextStyle over1;
  final AppThemeTextStyle over2;
  final AppThemeTextStyle decoration;

  AppThemeText(
    double fontSize, AppThemeData themeData
  ) :
    this.over1 = AppThemeTextStyle(fontSize, themeData.overColor1),
    this.over2 = AppThemeTextStyle(fontSize, themeData.overColor2),
    this.decoration = AppThemeTextStyle(fontSize, themeData.decorationColor);
}

class AppThemeData {
  final Color baseColor;
  final Color overColor1;
  final Color overColor2;
  final Color decorationColor;
  late final AppThemeText normalHeader = AppThemeText(AppTheme.normalHeaderFontSize, this);
  late final AppThemeText normalText = AppThemeText(AppTheme.normalTextFontSize, this);
  late final AppThemeText largeHeader = AppThemeText(AppTheme.largeHeaderFontSize, this);
  late final AppThemeText largeText = AppThemeText(AppTheme.largeTextFontSize, this);
  late final AppThemeText xLargeHeader = AppThemeText(AppTheme.xLargeHeaderFontSize, this);
  late final AppThemeText xLargeText = AppThemeText(AppTheme.xLargeTextFontSize, this);

  AppThemeData({
    this.baseColor = Colors.transparent,
    this.overColor1 = Colors.transparent,
    this.overColor2 = Colors.transparent,
    this.decorationColor = Colors.transparent
  });
}

extension AppThemeColorExtension on Color {
  Color get inkEffectAlpha => this.withValues(alpha: 0.12);
}