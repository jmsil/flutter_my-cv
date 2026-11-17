import 'package:pdf/widgets.dart';

import 'theme.dart';

class PdfText extends Text {
  static const String bulletReplacer = '–';
  static const String listJoiner = ' – ';

  PdfText(
    String text,
    {
      super.style
    }
  ) : super(
    text.replaceAll('▪', bulletReplacer)
  );
}

class PdfLink extends UrlLink {
  PdfLink(
    String text, String url, bool enableBoldStyle
  ) : super(
    destination: url,
    child: PdfText(
      text,
      style: enableBoldStyle ? PdfTheme.normalTextLinkBoldStyle: PdfTheme.normalTextLinkStyle
    )
  );
}