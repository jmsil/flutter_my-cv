import 'package:pdf/widgets.dart';

import '../ui/strings/strings.dart';
import 'text.dart';
import 'theme.dart';

class PdfTitleDetailLinkTable extends StatelessWidget {
  final List<PdfTitleDetailLinkRow> rows;

  PdfTitleDetailLinkTable(this.rows);

  @override
  Widget build(Context context) {
    final List<Widget> builtChildren = [];

    for (PdfTitleDetailLinkRow row in rows) {
      builtChildren.add(_Row(row.title, row.detail, row.link));
      builtChildren.add(PdfTheme.smallSpacerV);
    }

    builtChildren.removeLast();

    return Column(children: builtChildren);
  }
}

class _Row extends Row {
  _Row(
    String title, String detail, String? link
  ) : super(
    children: [
      PdfText(PdfText.bulletReplacer, style: PdfTheme.normalTextBoldStyle),
      PdfTheme.xSmallSpacerH,

      link == null
        ? PdfText(title, style: PdfTheme.normalTextBoldStyle)
        : PdfLink(title, link, true),

      PdfText(Strings.pipeJoiner, style: PdfTheme.normalTextStyle),
      PdfText(detail, style: PdfTheme.normalTextItalicStyle)
    ]
  );
}

class PdfTitleDetailLinkRow {
  final String title;
  final String detail;
  final String? link;

  PdfTitleDetailLinkRow(this.title, this.detail, [this.link]);
}