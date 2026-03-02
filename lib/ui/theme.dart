import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double radiusValue = 16;
  static const double scaffoldPaddingValue = 16;
  static const double _fontSize = 15;
  static const double _largeFontSize = 16;
  static const double _xLargeFontSize = 17;
  static const double _xxLargeFontSize = 18;

  static final Color highLightColor = Colors.blueGrey[50]!;
  static final Color lowLightColor = Colors.blueGrey[300]!;
  static final Color highDarkColor = Color(0xFF242F34);
  static final Color lowDarkColor = Colors.blueGrey[700]!;
  static final Color highLightBlue = Colors.blue[100]!;
  static final Color lightBlue = Colors.blue[200]!;
  static final Color darkBlue = Colors.blue[900]!;
  static final Color darkColor = Colors.black;
  static final Color navigatorBackgroundColor = Colors.black54;

  static final TextStyle darkStyle = TextStyle(
    fontSize: _fontSize, color: darkColor
  );
  static final TextStyle darkBoldStyle = TextStyle(
    fontSize: _fontSize, color: darkColor, fontWeight: FontWeight.bold
  );
  static final TextStyle darkItalicStyle = TextStyle(
    fontSize: _fontSize, color: darkColor, fontStyle: FontStyle.italic
  );
  static final TextStyle largeDarkBoldStyle = TextStyle(
    fontSize: _largeFontSize, color: darkColor, fontWeight: FontWeight.bold
  );
  static final TextStyle darkBlueStyle = TextStyle(
    fontSize: _fontSize, color: darkBlue
  );
  static final TextStyle highLightBlueStyle = TextStyle(
    fontSize: _fontSize, color: highLightBlue
  );
  static final TextStyle lightBlueStyle = TextStyle(
    fontSize: _fontSize, color: lightBlue
  );
  static final TextStyle lightBlueBoldStyle = TextStyle(
    fontSize: _fontSize, color: lightBlue, fontWeight: FontWeight.bold
  );
  static final TextStyle largeLightBlueStyle = TextStyle(
    fontSize: _largeFontSize, color: lightBlue
  );
  static final TextStyle largeLightBlueBoldStyle = TextStyle(
    fontSize: _largeFontSize, color: lightBlue, fontWeight: FontWeight.bold
  );
  static final TextStyle xLargeLightBlueStyle = TextStyle(
    fontSize: _xLargeFontSize, color: lightBlue
  );
  static final TextStyle xxLargeLightBlueBoldStyle = TextStyle(
    fontSize: _xxLargeFontSize, color: lightBlue, fontWeight: FontWeight.bold
  );

  static const EdgeInsets scaffoldPadding = EdgeInsets.all(scaffoldPaddingValue);

  static const Radius radius = Radius.circular(radiusValue);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);
}