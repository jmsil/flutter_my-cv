import 'package:flutter/material.dart';

class AppTheme {
  static final AppTheme flat = AppTheme._();
  static final AppTheme left = AppTheme._();
  static final AppTheme top = AppTheme._();
  static final AppTheme full = AppTheme._();

  static const double radiusValue = 16;
  static const Radius radius = Radius.circular(radiusValue);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);

  static const Curve animationCurve = Curves.decelerate;
  static const Duration animationDuration = Duration(milliseconds: 380);

  static const BorderRadius circleBorderRadius = BorderRadius.all(Radius.circular(999999));

  AppTheme._({
    Color? backgroundColor,
    Color? overBackgroundColor1,
    Color? overBackgroundColor2,

    Color? elementColor1,
    Color? overElement1Color1,

    Color? elementColor2,
    Color? overElement2Color1,

    Color? elementColor3,
    Color? overElement3Color1,

    Color? sectionColor,
    Color? overSectionColor1,
    Color? overSectionColor2,
    Color? overSectionColor3
  })
    : this.backgroundColor = backgroundColor ?? Colors.blueGrey[50]!,
      this.overBackgroundColor1 = overBackgroundColor1 ?? Colors.black,
      this.overBackgroundColor2 = overBackgroundColor2 ?? Colors.blue[900]!,

      this.elementColor1 = elementColor1 ?? Color(0xFF242F34),
      this.overElement1Color1 = overElement1Color1 ??  Colors.blue[200]!,

      this.elementColor2 = elementColor2 ?? Colors.blueGrey[700]!,
      this.overElement2Color1 = overElement2Color1 ?? Colors.blueGrey[50]!,

      this.elementColor3 = elementColor3 ?? Colors.blueGrey[300]!,
      this.overElement3Color1 = overElement3Color1 ?? Colors.black,

      this.sectionColor = sectionColor ?? Colors.black26,
      this.overSectionColor1 = overSectionColor1 ?? Colors.blue[100]!,
      this.overSectionColor2 = overSectionColor2 ?? Colors.blue[200]!,
      this.overSectionColor3 = overSectionColor3 ?? Colors.blue[200]!;

  final double text1FontSize = 15;
  final double header1FontSize = 16;
  final double text2FontSize = 17;
  final double header2FontSize = 18;

  final Color backgroundColor;
  final Color overBackgroundColor1;
  final Color overBackgroundColor2;

  final Color elementColor1;
  final Color overElement1Color1;

  final Color elementColor2;
  final Color overElement2Color1;

  final Color elementColor3;
  final Color overElement3Color1;

  final Color sectionColor;
  final Color overSectionColor1;
  final Color overSectionColor2;
  final Color overSectionColor3;

  late final Color inkEffectsColor = elementColor3.withValues(alpha: 0.32);

  late final TextStyle text1OverBackgroundColor1Style = TextStyle(
    fontSize: text1FontSize, color: overBackgroundColor1);
  late final TextStyle text1OverBackgroundColor1BoldStyle = TextStyle(
    fontSize: text1FontSize, color: overBackgroundColor1, fontWeight: FontWeight.bold);
  late final TextStyle text1OverBackgroundColor1ItalicStyle = TextStyle(
    fontSize: text1FontSize, color: overBackgroundColor1, fontStyle: FontStyle.italic);
  late final TextStyle text1OverBackgroundColor2Style = TextStyle(
    fontSize: text1FontSize, color: overBackgroundColor2);
  late final TextStyle text1OverBackgroundColor2BoldStyle = TextStyle(
    fontSize: text1FontSize, color: overBackgroundColor2, fontWeight: FontWeight.bold);
  late final TextStyle header1OverBackgroundColor1BoldStyle = TextStyle(
    fontSize: header1FontSize, color: overBackgroundColor1, fontWeight: FontWeight.bold);
  late final TextStyle text2OverBackgroundColor1Style = TextStyle(
    fontSize: text2FontSize, color: overBackgroundColor1);
  late final TextStyle header2OverBackgroundColor1BoldStyle = TextStyle(
    fontSize: header2FontSize, color: overBackgroundColor1, fontWeight: FontWeight.bold);

  late final TextStyle text1OverElement1Color1Style = TextStyle(
    fontSize: text1FontSize, color: overElement1Color1);
  late final TextStyle text1OverElement1Color1BoldStyle = TextStyle(
    fontSize: text1FontSize, color: overElement1Color1, fontWeight: FontWeight.bold);
  late final TextStyle header1OverElement1Color1BoldStyle = TextStyle(
    fontSize: header1FontSize, color: overElement1Color1, fontWeight: FontWeight.bold);
  late final TextStyle text2OverElement1Color1Style = TextStyle(
    fontSize: text2FontSize, color: overElement1Color1);
  late final TextStyle header2OverElement1Color1BoldStyle = TextStyle(
    fontSize: header2FontSize, color: overElement1Color1, fontWeight: FontWeight.bold);

  late final TextStyle header1OverElement3Color1BoldStyle = TextStyle(
    fontSize: header1FontSize, color: overElement3Color1, fontWeight: FontWeight.bold);

  late final TextStyle text1OverSectionColor1Style = TextStyle(
    fontSize: text1FontSize, color: overSectionColor1);
  late final TextStyle text1OverSectionColor3Style = TextStyle(
    fontSize: text1FontSize, color: overSectionColor3);
  late final TextStyle header1OverSectionColor2BoldStyle = TextStyle(
    fontSize: header1FontSize, color: overSectionColor2, fontWeight: FontWeight.bold);
}