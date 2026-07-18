import 'package:flutter/material.dart';

class AppTheme {
  static const double normalFontSize = 15;
  static const double largeFontSize = 16;
  static const double xLargeFontSize = 17;
  static const double xxLargeFontSize = 18;

  static final Color highLightColor = Colors.blueGrey[50]!;
  static final Color lowLightColor = Colors.blueGrey[300]!;
  static final Color highDarkColor = Color(0xFF242F34);
  static final Color lowDarkColor = Colors.blueGrey[700]!;
  static final Color highLightBlue = Colors.blue[100]!;
  static final Color lightBlue = Colors.blue[200]!;
  static final Color darkBlue = Colors.blue[900]!;
  static final Color darkColor = Colors.black;
  static final Color mainScaffoldBackgroundColor = highLightColor;

  static final TextStyle darkStyle = TextStyle(
    fontSize: normalFontSize, color: darkColor
  );
  static final TextStyle darkBoldStyle = TextStyle(
    fontSize: normalFontSize, color: darkColor, fontWeight: FontWeight.bold
  );
  static final TextStyle darkItalicStyle = TextStyle(
    fontSize: normalFontSize, color: darkColor, fontStyle: FontStyle.italic
  );
  static final TextStyle largeDarkBoldStyle = TextStyle(
    fontSize: largeFontSize, color: darkColor, fontWeight: FontWeight.bold
  );
  static final TextStyle darkBlueStyle = TextStyle(
    fontSize: normalFontSize, color: darkBlue
  );
  static final TextStyle highLightBlueStyle = TextStyle(
    fontSize: normalFontSize, color: highLightBlue
  );
  static final TextStyle lightBlueStyle = TextStyle(
    fontSize: normalFontSize, color: lightBlue
  );
  static final TextStyle lightBlueBoldStyle = TextStyle(
    fontSize: normalFontSize, color: lightBlue, fontWeight: FontWeight.bold
  );
  static final TextStyle largeLightBlueStyle = TextStyle(
    fontSize: largeFontSize, color: lightBlue
  );
  static final TextStyle largeLightBlueBoldStyle = TextStyle(
    fontSize: largeFontSize, color: lightBlue, fontWeight: FontWeight.bold
  );
  static final TextStyle xLargeLightBlueStyle = TextStyle(
    fontSize: xLargeFontSize, color: lightBlue
  );
  static final TextStyle xxLargeLightBlueBoldStyle = TextStyle(
    fontSize: xxLargeFontSize, color: lightBlue, fontWeight: FontWeight.bold
  );
}