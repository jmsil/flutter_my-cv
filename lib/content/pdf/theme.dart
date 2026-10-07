import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTheme {
  static const double _normalFontSize = 11;
  static const double _largeFontSize = 13;
  static const double _xLargeFontSize = 15;

  static const double tinySpacing = 4;
  static const double smallSpacing = 8;
  static const double normalSpacing = 12;
  static const double largeSpacing = 24;
  static const double xLargeSpacing = 32;

  static PdfColor backgroundColor = PdfColors.blueGrey50;
  static PdfColor decorationColor = PdfColors.blueGrey100;

  static final TextStyle normalTextStyle = TextStyle(fontSize: _normalFontSize);
  static final TextStyle normalTextBoldStyle = TextStyle(
    fontSize: _normalFontSize, fontWeight: FontWeight.bold);
  static final TextStyle normalTextItalicStyle = TextStyle(
    fontSize: _normalFontSize, fontStyle: FontStyle.italic);
  static final TextStyle normalTextLinkStyle = TextStyle(
    fontSize: _normalFontSize, color: PdfColors.blue900, decoration: TextDecoration.underline);
  static final TextStyle largeTextStyle = TextStyle(fontSize: _largeFontSize);
  static final TextStyle largeTextBoldStyle = TextStyle(
    fontSize: _largeFontSize, fontWeight: FontWeight.bold);
  static final TextStyle xLargeTextBoldStyle = TextStyle(
    fontSize: _xLargeFontSize, fontWeight: FontWeight.bold);

  static final SizedBox tinyVerticalSpace = SizedBox(height: tinySpacing);
  static final SizedBox smallVerticalSpace = SizedBox(height: smallSpacing);
  static final SizedBox normalHorizontalSpace = SizedBox(width: normalSpacing);
  static final SizedBox normalVerticalSpace = SizedBox(height: normalSpacing);
  static final SizedBox largeVerticalSpace = SizedBox(height: largeSpacing);
  static final SizedBox xLargeHorizontalSpace = SizedBox(width: xLargeSpacing);
  static final SizedBox xLargeVerticalSpace = SizedBox(height: xLargeSpacing);
}