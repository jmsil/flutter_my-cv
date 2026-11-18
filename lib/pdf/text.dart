import 'package:pdf/widgets.dart';

import 'theme.dart';

class PdfText extends Text {
  PdfText(
    String text,
    {
      super.style
    }
  ) : super(
    text.replaceAll('▪', bulletReplacer)
  );

  static String get bulletReplacer => '–';
  static String get listJoiner => ' – ';
  static String get listJoinerPipe => ' | ';
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