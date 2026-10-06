import 'package:pdf/widgets.dart';

import 'theme.dart';

class PdfText extends Text {
  static const String bulletReplacer = '–';

  PdfText(
    String text,
    {
      super.style
    }
  ) : super(
    text.replaceAll('▪', bulletReplacer)
  );
}

class PdfBulletText extends PdfText {
  PdfBulletText(
    String text,
    {
      super.style
    }
  ) : super(
    '▪ ' + text
  );
}

class PdfLink extends UrlLink {
  PdfLink(String text, String url) : super(
    destination: url,
    child: PdfText(text, style: PdfTheme.normalTextLinkStyle)
  );
}