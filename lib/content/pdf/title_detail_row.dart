import 'package:pdf/widgets.dart';

import 'text.dart';
import 'theme.dart';

class PdfTitleDetailRow extends StatelessWidget {
  final String title;
  final String detail;

  PdfTitleDetailRow(this.title, this.detail);

  @override
  Widget build(Context context) {
    return Wrap(
      spacing: PdfTheme.normalSpacing,
      children: [
        PdfBulletText(title, style: PdfTheme.normalTextBoldStyle),
        PdfText(detail, style: PdfTheme.normalTextItalicStyle)
      ]
    );
  }
}