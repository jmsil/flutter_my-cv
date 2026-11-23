import 'package:pdf/widgets.dart';

import 'divider.dart';
import 'text.dart';
import 'theme.dart';

class PdfCoverLetter extends StatelessWidget {
  final List<String> info;

  PdfCoverLetter(this.info);

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PdfTheme.largeSpacerV,
        PdfDivider(),
        PdfTheme.largeSpacerV,
        PdfText(info[0], style: PdfTheme.largeTextBoldStyle),
        PdfTheme.largeSpacerV,
        PdfText(info[1], style: PdfTheme.normalTextStyle),
        PdfTheme.largeSpacerV,
        PdfText(info[2], style: PdfTheme.normalTextItalicStyle)
      ]
    );
  }
}