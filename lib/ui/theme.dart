import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const double radiusValue = 16;
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

  static const Radius radius = Radius.circular(radiusValue);
  static const BorderRadius allBorderRadius = BorderRadius.all(radius);
}

class ThemedEdgeInsets extends EdgeInsets {
  static const double smallValue = 8;
  static const double normalValue = 16;
  static const double largeValue = 24;
  static const double xLargeValue = 32;

  const ThemedEdgeInsets.small({
    double? left, double? top, double? right, double? bottom
  })
    : super.fromLTRB(
        left ?? smallValue,
        top ?? smallValue,
        right ?? smallValue,
        bottom ?? smallValue
      );

  const ThemedEdgeInsets.normal({
    double? left, double? top, double? right, double? bottom
  })
    : super.fromLTRB(
        left ?? normalValue,
        top ?? normalValue,
        right ?? normalValue,
        bottom ?? normalValue
      );

  const ThemedEdgeInsets.large({
    double? left, double? top, double? right, double? bottom
  })
    : super.fromLTRB(
        left ?? largeValue,
        top ?? largeValue,
        right ?? largeValue,
        bottom ?? largeValue
      );

  const ThemedEdgeInsets.xLarge({
    double? left, double? top, double? right, double? bottom
  })
    : super.fromLTRB(
        left ?? xLargeValue,
        top ?? xLargeValue,
        right ?? xLargeValue,
        bottom ?? xLargeValue
      );
}