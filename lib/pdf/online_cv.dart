import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_model.dart';
import 'text.dart';
import 'theme.dart';

class PdfOnlineCv extends StatelessWidget {
  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PdfTheme.largeSpacerV,
        Text(StringsModel.strings.visitOnlineResume, style: PdfTheme.normalTextStyle),
        PdfTheme.xSmallSpacerV,
        PdfLink(Strings.personalCvLink, Strings.personalCvLink, false)
      ]
    );
  }
}