import 'package:flutter/material.dart';

class AppTheme {
  static const double radiusValue = 16;
  static const Radius radius = Radius.circular(radiusValue);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);

  static const Curve animationCurve = Curves.decelerate;
  static const Duration animationDuration = Duration(milliseconds: 380);

  static const BorderRadius circleBorderRadius = BorderRadius.all(Radius.circular(999999));

  double get text1FontSize => 15;
  double get header1FontSize => 16;
  double get text2FontSize => 17;
  double get header2FontSize => 18;

  Color get backgroundColor => Colors.blueGrey[50]!;
  Color get overBackgroundColor1 => Colors.black;
  Color get overBackgroundColor2 => Colors.blue[900]!;

  Color get elementColor1 => Color(0xFF242F34);
  Color get overElement1Color1 => Colors.blue[200]!;

  Color get elementColor2 => Colors.blueGrey[700]!;
  Color get overElement2Color1 => Colors.blueGrey[50]!;

  Color get elementColor3 => Colors.blueGrey[300]!;
  Color get overElement3Color1 => Colors.black;

  Color get sectionColor => Colors.black26;
  Color get overSectionColor1 => Colors.blue[100]!;
  Color get overSectionColor2 => Colors.blue[200]!;
  Color get overSectionColor3 => Colors.blue[200]!;

  Color get inkEffectsColor => elementColor3.withValues(alpha: 0.32);

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