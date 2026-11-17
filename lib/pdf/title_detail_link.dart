import 'package:pdf/widgets.dart';

import 'text.dart';
import 'theme.dart';

class PdfTitleDetailLinkTable extends Table {
  PdfTitleDetailLinkTable({
    bool isTitleFlex = false,
    bool isDetailFlex = false,
    bool isSpacingFlex = true,
    required List<PdfTitleDetailLinkRow> children
  }) : super(
    columnWidths: {
      0: const IntrinsicColumnWidth(),
      1: isTitleFlex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      2: isSpacingFlex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      3: isDetailFlex ? const FlexColumnWidth() : const IntrinsicColumnWidth()
    },
    children: _getChildrenWithSpace(children)
  );

  static List<TableRow> _getChildrenWithSpace(List<PdfTitleDetailLinkRow> children) {
    final List<TableRow> childrenWithSpace = [];
    final TableRow spaceRow = TableRow(children: [PdfTheme.smallVerticalSpace]);

    for (PdfTitleDetailLinkRow child in children) {
      childrenWithSpace.add(child);
      childrenWithSpace.add(spaceRow);
    }

    childrenWithSpace.removeLast();
    return childrenWithSpace;
  }
}

class PdfTitleDetailLinkRow extends TableRow {
  PdfTitleDetailLinkRow(
    String title,
    String detail,
    {
      String? certificationLink
    }
  ) : super(
    children: [
      PdfText(PdfText.bulletReplacer + ' ', style: PdfTheme.normalTextBoldStyle),

      certificationLink == null
        ? PdfText(title, style: PdfTheme.normalTextBoldStyle)
        : PdfLink(title, certificationLink, true),

      PdfTheme.xLargeHorizontalSpace,
      PdfText(detail, style: PdfTheme.normalTextItalicStyle)
    ]
  );
}