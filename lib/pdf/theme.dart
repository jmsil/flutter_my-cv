import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTheme {
  static double get _normalFontSize => 11;
  static double get _largeFontSize => 13;
  static double get _xLargeFontSize => 15;

  static double get xSmallDimen => 4;
  static double get smallDimen => 8;
  static double get normalDimen => 12;
  static double get largeDimen => 24;
  static double get xLargeDimen => 48;

  static PdfColor get backgroundColor => PdfColors.blueGrey50;
  static PdfColor get decorationColor => PdfColors.blueGrey100;
  static PdfColor get linkColor => PdfColors.blue900;
  static PdfColor get bulletColor => PdfColors.black;

  static TextStyle get normalTextStyle => TextStyle(fontSize: _normalFontSize);
  static TextStyle get normalTextBoldStyle => TextStyle(
    fontSize: _normalFontSize, fontWeight: FontWeight.bold);
  static TextStyle get normalTextItalicStyle => TextStyle(
    fontSize: _normalFontSize, fontStyle: FontStyle.italic);
  static TextStyle get normalTextLinkStyle => TextStyle(
    fontSize: _normalFontSize, color: linkColor, decoration: TextDecoration.underline);
  static TextStyle get normalTextLinkBoldStyle => TextStyle(
    fontSize: _normalFontSize, color: linkColor,
    fontWeight: FontWeight.bold, decoration: TextDecoration.underline
  );
  static TextStyle get largeTextStyle => TextStyle(fontSize: _largeFontSize);
  static TextStyle get largeTextBoldStyle => TextStyle(
    fontSize: _largeFontSize, fontWeight: FontWeight.bold);
  static TextStyle get xLargeTextBoldStyle => TextStyle(
    fontSize: _xLargeFontSize, fontWeight: FontWeight.bold);

  static SizedBox get xSmallSpacerH => SizedBox(width: xSmallDimen);
  static SizedBox get xSmallSpacerV => SizedBox(height: xSmallDimen);
  static SizedBox get smallSpacerH => SizedBox(width: smallDimen);
  static SizedBox get smallSpacerV => SizedBox(height: smallDimen);
  static SizedBox get normalSpacerH => SizedBox(width: normalDimen);
  static SizedBox get normalSpacerV => SizedBox(height: normalDimen);
  static SizedBox get largeSpacerV => SizedBox(height: largeDimen);
  static SizedBox get xLargeSpacerH => SizedBox(width: xLargeDimen);
}