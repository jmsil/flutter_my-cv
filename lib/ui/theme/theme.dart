import 'package:flutter/material.dart';

abstract class AppTheme {
  double get radiusValue => 16;

  double get normalFontSize => 15;
  double get largeFontSize => 16;
  double get xLargeFontSize => 17;
  double get xxLargeFontSize => 18;

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

  late final TextStyle normalOverBackgroundColor1Style = TextStyle(
    fontSize: normalFontSize, color: overBackgroundColor1);
  late final TextStyle normalOverBackgroundColor1BoldStyle = TextStyle(
    fontSize: normalFontSize, color: overBackgroundColor1, fontWeight: FontWeight.bold);
  late final TextStyle normalOverBackgroundColor1ItalicStyle = TextStyle(
    fontSize: normalFontSize, color: overBackgroundColor1, fontStyle: FontStyle.italic);
  late final TextStyle normalOverBackgroundColor2Style = TextStyle(
    fontSize: normalFontSize, color: overBackgroundColor2);
  late final TextStyle normalOverBackgroundColor2BoldStyle = TextStyle(
    fontSize: normalFontSize, color: overBackgroundColor2, fontWeight: FontWeight.bold);
  late final TextStyle largeOverBackgroundColor1BoldStyle = TextStyle(
    fontSize: largeFontSize, color: overBackgroundColor1, fontWeight: FontWeight.bold);

  late final TextStyle normalOverElement1Color1Style = TextStyle(
    fontSize: normalFontSize, color: overElement1Color1);
  late final TextStyle normalOverElement1Color1BoldStyle = TextStyle(
    fontSize: normalFontSize, color: overElement1Color1, fontWeight: FontWeight.bold);
  late final TextStyle xLargeOverElement1Color1Style = TextStyle(
    fontSize: xLargeFontSize, color: overElement1Color1);
  late final TextStyle xxLargeOverElement1Color1BoldStyle = TextStyle(
    fontSize: xxLargeFontSize, color: overElement1Color1, fontWeight: FontWeight.bold);

  late final TextStyle largeOverElement3Color1BoldStyle = TextStyle(
    fontSize: largeFontSize, color: overElement3Color1, fontWeight: FontWeight.bold);

  late final TextStyle normalOverSectionColor1Style = TextStyle(
    fontSize: normalFontSize, color: overSectionColor1);
  late final TextStyle normalOverSectionColor3Style = TextStyle(
    fontSize: normalFontSize, color: overSectionColor3);
  late final TextStyle largeOverSectionColor2BoldStyle = TextStyle(
    fontSize: largeFontSize, color: overSectionColor2, fontWeight: FontWeight.bold);

  late final Radius radius = Radius.circular(radiusValue);
  late final BorderRadius allBorderRadius = BorderRadius.all(radius);

  final Curve animationCurve = Curves.decelerate;
  final Duration animationDuration = Duration(milliseconds: 380);
}