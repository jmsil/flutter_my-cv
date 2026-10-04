import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTheme {
  static const double _normalFontSize = 12;
  static const double _largeFontSize = 14;

  static const double smallSpacing = 4;
  static const double normalSpacing = 12;
  static const double largeSpacing = 32;
  static const double xLargeSpacing = 40;

  static PdfColor backgroundColor = PdfColors.blueGrey50;
  static PdfColor decorationColor = PdfColors.blueGrey100;

  static final TextStyle normalTextStyle = TextStyle(fontSize: _normalFontSize);
  static final TextStyle normalTextBoldStyle = TextStyle(
    fontSize: _normalFontSize, fontWeight: FontWeight.bold);
  static final TextStyle normalTextItalicStyle = TextStyle(
    fontSize: _normalFontSize, fontStyle: FontStyle.italic);
  static final TextStyle largeTextStyle = TextStyle(fontSize: _largeFontSize);
  static final TextStyle largeTextBoldStyle = TextStyle(
    fontSize: _largeFontSize, fontWeight: FontWeight.bold);

  static final SizedBox normalHorizontalSpace = SizedBox(width: normalSpacing);
  static final SizedBox normalVerticalSpace = SizedBox(height: normalSpacing);
  static final SizedBox xLargeVerticalSpace = SizedBox(height: xLargeSpacing);
}