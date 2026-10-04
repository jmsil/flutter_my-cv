import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_provider.dart';
import 'group.dart';
import 'title_detail_row.dart';
import 'theme.dart';

class PdfLanguages extends StatelessWidget {
  @override
  Widget build(Context context) {
    final List<Widget> children = [];
    final List<String> languages = StringsProvider.strings.languagesInfo.split(' - ');

    for (String listItem in languages) {
      List<String> parts = listItem.split('\n');
      PdfTitleDetailRow langWidget = PdfTitleDetailRow(parts.removeAt(0), parts.join(' '));
      children.add(langWidget);
    }

    return PdfMainGroup.children(
      title: StringsProvider.strings.languagesTitle,
      childrenSpacing: PdfTheme.smallSpacing,
      children: children
    );
  }
}