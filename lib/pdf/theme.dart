import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfTheme {
  static const double _normalFontSize = 11;
  static const double _largeFontSize = 13;
  static const double _xLargeFontSize = 15;

  static const double xSmallSpacing = 4;
  static const double smallSpacing = 8;
  static const double normalSpacing = 12;
  static const double largeSpacing = 24;
  static const double xLargeSpacing = 32;
  static const double xxLargeSpacing = 48;

  static PdfColor backgroundColor = PdfColors.blueGrey50;
  static PdfColor decorationColor = PdfColors.blueGrey100;
  static PdfColor linkColor = PdfColors.blue900;
  static PdfColor bulletColor = PdfColors.black;

  static final TextStyle normalTextStyle = TextStyle(fontSize: _normalFontSize);
  static final TextStyle normalTextBoldStyle = TextStyle(
    fontSize: _normalFontSize, fontWeight: FontWeight.bold);
  static final TextStyle normalTextItalicStyle = TextStyle(
    fontSize: _normalFontSize, fontStyle: FontStyle.italic);
  static final TextStyle normalTextLinkStyle = TextStyle(
    fontSize: _normalFontSize, color: linkColor, decoration: TextDecoration.underline);
  static final TextStyle normalTextLinkBoldStyle = TextStyle(
    fontSize: _normalFontSize, color: linkColor,
    fontWeight: FontWeight.bold, decoration: TextDecoration.underline
  );
  static final TextStyle largeTextStyle = TextStyle(fontSize: _largeFontSize);
  static final TextStyle largeTextBoldStyle = TextStyle(
    fontSize: _largeFontSize, fontWeight: FontWeight.bold);
  static final TextStyle xLargeTextBoldStyle = TextStyle(
    fontSize: _xLargeFontSize, fontWeight: FontWeight.bold);

  static final SizedBox xSmallSpacerH = SizedBox(width: xSmallSpacing);
  static final SizedBox xSmallSpacerV = SizedBox(height: xSmallSpacing);
  static final SizedBox smallSpacerH = SizedBox(width: smallSpacing);
  static final SizedBox smallSpacerV = SizedBox(height: smallSpacing);
  static final SizedBox normalSpacerH = SizedBox(width: normalSpacing);
  static final SizedBox normalSpacerV = SizedBox(height: normalSpacing);
  static final SizedBox largeSpacerV = SizedBox(height: largeSpacing);
  static final SizedBox xLargeSpacerV = SizedBox(height: xLargeSpacing);
  static final SizedBox xxLargeSpacerH = SizedBox(width: xxLargeSpacing);
}