import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTheme {
  static const double _normalFontSize = 12;
  static const double _largeFontSize = 14;

  static const double tinySpacing = 4;
  static const double smallSpacing = 8;
  static const double normalSpacing = 12;
  static const double largeSpacing = 32;
  static const double xLargeSpacing = 40;
  static const double xxLargeSpacing = 64;

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

  static final SizedBox tinyVerticalSpace = SizedBox(height: tinySpacing);
  static final SizedBox smallVerticalSpace = SizedBox(height: smallSpacing);
  static final SizedBox normalHorizontalSpace = SizedBox(width: normalSpacing);
  static final SizedBox normalVerticalSpace = SizedBox(height: normalSpacing);
  static final SizedBox largeHorizontalSpace = SizedBox(width: largeSpacing);
  static final SizedBox largeVerticalSpace = SizedBox(height: largeSpacing);
  static final SizedBox xLargeVerticalSpace = SizedBox(height: xLargeSpacing);
  static final SizedBox xxLargeVerticalSpace = SizedBox(height: xxLargeSpacing);
}