import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_model.dart';
import 'group.dart';
import 'title_detail_link.dart';

class PdfLanguages extends StatelessWidget {
  @override
  Widget build(Context context) {
    final List<PdfTitleDetailLinkRow> children = [];
    final List<String> languages = StringsModel.strings.languagesInfo.split(' - ');

    for (String listItem in languages) {
      List<String> parts = listItem.split('\n');
      PdfTitleDetailLinkRow langWidget = PdfTitleDetailLinkRow(parts.removeAt(0), parts.join(' '));
      children.add(langWidget);
    }

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