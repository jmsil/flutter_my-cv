import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double radiusValue = 16;
  static const double scaffoldPaddingValue = 16;
  static const double _fontSize = 15;
  static const double _largeFontSize = 16;

  static final Color highLightColor = Colors.blueGrey[50]!;
  static final Color midLightColor = Colors.blueGrey[200]!;
  static final Color lowLightColor = Colors.blueGrey[300]!;
  static final Color highDarkColor = Colors.blueGrey[800]!;
  static final Color midDarkColor = Colors.blueGrey[700]!;
  static final Color lowDarkColor = Colors.blueGrey[500]!;
  static final Color lightBlue = Colors.blue[200]!;
  static final Color darkBlue = Colors.blue[900]!;
  static final Color darkColor = Colors.black;
  static final Color navigatorBackgroundColor = Colors.black38;

  static final TextStyle highLightStyle = TextStyle(fontSize: _fontSize, color: highLightColor);
  static final TextStyle lowLightStyle = TextStyle(fontSize: _fontSize, color: lowLightColor);
  static final TextStyle lightBlueStyle = TextStyle(fontSize: _fontSize, color: lightBlue);
  static final TextStyle darkBlueStyle = TextStyle(fontSize: _fontSize, color: darkBlue);
  static final TextStyle darkBlueBoldStyle = TextStyle(
    fontSize: _fontSize, color: darkBlue, fontWeight: FontWeight.bold
  );
  static final TextStyle darkBlueItalicStyle = TextStyle(
    fontSize: _fontSize, color: darkBlue, fontStyle: FontStyle.italic
  );
  static final TextStyle darkStyle = TextStyle(fontSize: _fontSize, color: darkColor);
  static final TextStyle darkBoldStyle = TextStyle(
    fontSize: _fontSize, color: darkColor, fontWeight: FontWeight.bold
  );
  static final TextStyle darkItalicStyle = TextStyle(
    fontSize: _fontSize, color: darkColor, fontStyle: FontStyle.italic
  );
  static final TextStyle largeDarkBoldStyle = TextStyle(
    fontSize: _largeFontSize, color: darkColor, fontWeight: FontWeight.bold
  );

  static const EdgeInsets scaffoldPadding = EdgeInsets.all(scaffoldPaddingValue);

  static final BorderRadius allRadius = BorderRadius.circular(radiusValue);
}