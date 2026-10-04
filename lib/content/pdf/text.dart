import 'package:pdf/widgets.dart';

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