import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_model.dart';
import 'group.dart';
import 'text.dart';
import 'title_detail_link.dart';

class PdfLanguages extends StatelessWidget {
  @override
  Widget build(Context context) {
    final List<PdfTitleDetailLinkRow> children = [];

    StringsModel.strings.languagesInfo.forEach((String listKey, List<String>? listValue) {
      children.add(PdfTitleDetailLinkRow(
        listKey, listValue!.join(' ${PdfText.bulletReplacer} ')
      ));
    });

    return PdfMainGroup.child(
      title: StringsModel.strings.languagesTitle,
      child: PdfTitleDetailLinkTable(
        isColumn1Flex: true,
        isSpacingFlex: false,
        children: children
      )
    );
  }
}