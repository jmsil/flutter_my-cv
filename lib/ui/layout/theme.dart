import 'package:flutter/material.dart';

import 'layout_theme_model.dart';

class AppTheme {
  static const double radiusValue = 16;
  static const Radius radius = Radius.circular(radiusValue);
  static const Radius circleRadius = Radius.circular(999);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);
  static const BorderRadius circleBorderRadius = BorderRadius.all(circleRadius);

  static const Curve animationCurve = Curves.decelerate;
  static const Duration animationDuration = Duration(milliseconds: 380);

  AppTheme._(this.background, this.appbar, this.sidebar, this.mainGroup, this.viewer);

  final AppThemeData background;
  final AppThemeData appbar;
  final AppThemeData sidebar;
  final AppThemeData mainGroup;
  final AppThemeData viewer;

  static AppTheme getTheme(AppLayoutMode layoutMode, Brightness themeMode) {
    final bool isLightMode = themeMode == Brightness.light;
    return AppTheme._(
      _getBackgroundThemeData(isLightMode),
      _getAppbarThemeData(isLightMode),
      _getSidebarThemeData(layoutMode.showSidebarBackground, isLightMode),
      _getMainGroupThemeData(isLightMode),
      _getViewerThemeData(isLightMode)
    );
  }

  static AppThemeData _getBackgroundThemeData(bool isLightMode) {
    return isLightMode
      ? AppThemeData(
          surfaceColor1: Colors.blueGrey[50]!,
          surfaceColor2: Colors.blueGrey[300]!,
          over1: AppThemeDataStyledProperty(Colors.black, Colors.blueGrey[700]),
          accent1: AppThemeDataStyledProperty(Colors.blue[900]!)
        )
      : AppThemeData(
          surfaceColor1: Color.alphaBlend(Colors.black38, Colors.blueGrey[900]!),
          surfaceColor2: Colors.blueGrey[700]!,
          over1: AppThemeDataStyledProperty(Colors.blueGrey[50]!),
          accent1: AppThemeDataStyledProperty(Colors.blue[200]!)
        );
  }

  static AppThemeData _getAppbarThemeData(bool isLightMode) {
    return isLightMode
      ? AppThemeData(
          surfaceColor1: Colors.blueGrey[900]!,
          over1: AppThemeDataStyledProperty(Colors.blue[200]!)
        )
      : AppThemeData(
          surfaceColor1: Colors.blueGrey[800]!,
          over1: AppThemeDataStyledProperty(Colors.blue[50]!)
        );
  }

  static AppThemeData _getSidebarThemeData(bool showSidebarBackground, bool isLightMode) {
    return showSidebarBackground
      ? isLightMode
        ? AppThemeData(
            surfaceColor1: Colors.blueGrey[700]!,
            surfaceColor2: Colors.blueGrey[900]!.withValues(alpha: 0.56),
            over1: AppThemeDataStyledProperty(Colors.blue[100]!),
            over2: AppThemeDataStyledProperty(Colors.blue[200]!, Colors.black),
            accent1: AppThemeDataStyledProperty(Colors.blue[200]!)
          )
        : AppThemeData(
            surfaceColor1: Color.alphaBlend(Colors.black12, Colors.blueGrey[900]!),
            surfaceColor2: Colors.blueGrey[800]!.withValues(alpha: 0.56),
            over1: AppThemeDataStyledProperty(Colors.blue[100]!),
            over2: AppThemeDataStyledProperty(Colors.blue[200]!),
            accent1: AppThemeDataStyledProperty(Colors.blue[200]!)
          )
      : isLightMode
        ? AppThemeData(
            surfaceColor1: Colors.transparent,
            surfaceColor2: Colors.blueGrey[900]!.withValues(alpha: 0.12),
            over1: AppThemeDataStyledProperty(Colors.black),
            over2: AppThemeDataStyledProperty(Colors.blueGrey[900]!),
            accent1: AppThemeDataStyledProperty(Colors.blue[900]!)
          )
        : AppThemeData(
            surfaceColor1: Colors.transparent,
            surfaceColor2: Colors.blueGrey[800]!.withValues(alpha: 0.32),
            over1: AppThemeDataStyledProperty(Colors.blue[100]!),
            over2: AppThemeDataStyledProperty(Colors.blue[200]!),
            accent1: AppThemeDataStyledProperty(Colors.blue[200]!)
          );
  }

  static AppThemeData _getMainGroupThemeData(bool isLightMode) {
    return isLightMode
      ? AppThemeData(
          surfaceColor1: Colors.blueGrey[700]!,
          over1: AppThemeDataStyledProperty(Colors.blue[100]!),
          over2: AppThemeDataBasicProperty(Colors.blueGrey[200]!)
        )
      : AppThemeData(
          surfaceColor1: Colors.blueGrey[900]!,
          over1: AppThemeDataStyledProperty(Colors.blue[200]!),
          over2: AppThemeDataBasicProperty(Colors.blueGrey[600]!)
        );
  }

  static AppThemeData _getViewerThemeData(bool isLightMode) {
    return AppThemeData(
      surfaceColor1: isLightMode
        ? Colors.blueGrey[50]!
        : Colors.blueGrey[200]!,
      over1: AppThemeDataStyledProperty(
        Colors.black,
        isLightMode ? Colors.blueGrey[700] : null
      ),
      over2: AppThemeDataBasicProperty(Colors.blueGrey[900]!),
      accent1: AppThemeDataBasicProperty(Colors.blue[900]!),
      accent2: AppThemeDataBasicProperty(Colors.blue[200]!)
    );
  }
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

  const AppThemeDataBasicProperty(this.color, [this._effectColor]);

  final Color color;

  final Color? _effectColor;
  Color get effectColor => _effectColor ?? color;
}

class AppThemeDataStyledProperty extends AppThemeDataBasicProperty {
  final AppThemeTextStyle normalHeader;
  final AppThemeTextStyle normalText;
  final AppThemeTextStyle largeHeader;
  final AppThemeTextStyle largeText;
  final AppThemeTextStyle xLargeHeader;
  final AppThemeTextStyle xLargeText;

  AppThemeDataStyledProperty(
    super.color, [super._effectColor]
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
    required this.surfaceColor1,
    this.surfaceColor2 = Colors.transparent,
    this.over1 = AppThemeDataBasicProperty.transparent,
    this.over2 = AppThemeDataBasicProperty.transparent,
    this.accent1 = AppThemeDataBasicProperty.transparent,
    this.accent2 = AppThemeDataBasicProperty.transparent
  });

  final Color surfaceColor1;
  final Color surfaceColor2;

  final AppThemeDataBasicProperty over1;
  AppThemeDataStyledProperty get overStyled1 => over1 as AppThemeDataStyledProperty;

  final AppThemeDataBasicProperty over2;
  AppThemeDataStyledProperty get overStyled2 => over2 as AppThemeDataStyledProperty;

  final AppThemeDataBasicProperty accent1;
  AppThemeDataStyledProperty get accentStyled1 => accent1 as AppThemeDataStyledProperty;

  final AppThemeDataBasicProperty accent2;
  AppThemeDataStyledProperty get accentStyled2 => accent2 as AppThemeDataStyledProperty;
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
  Color get withCardBorderAlpha => this.withValues(alpha: 0.32);
}