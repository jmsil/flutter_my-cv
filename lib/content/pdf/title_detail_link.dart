import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_provider.dart';
import 'text.dart';
import 'theme.dart';

class PdfTitleDetailLinkTable extends Table {
  PdfTitleDetailLinkTable({
    bool isColumn0Flex = false,
    bool isColumn1Flex = false,
    bool isColumn2Flex = false,
    bool isSpacingFlex = true,
    required List<PdfTitleDetailLinkRow> children
  }) : super(
    columnWidths: {
      0: const IntrinsicColumnWidth(),
      1: isColumn0Flex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      2: isSpacingFlex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      3: isColumn1Flex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      4: isSpacingFlex ? const FlexColumnWidth() : const IntrinsicColumnWidth(),
      5: isColumn2Flex ? const FlexColumnWidth() : const IntrinsicColumnWidth()
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
      PdfText(title, style: PdfTheme.normalTextBoldStyle),
      PdfTheme.largeHorizontalSpace,
      PdfText(detail, style: PdfTheme.normalTextItalicStyle),

      if (certificationLink != null)
        PdfTheme.largeHorizontalSpace,

      if (certificationLink != null)
        PdfLink(StringsProvider.strings.verifyCertification, certificationLink)
    ]
  );
}