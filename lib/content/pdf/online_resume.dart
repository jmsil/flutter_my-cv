import 'package:pdf/widgets.dart';

import '../../ui/strings/strings_provider.dart';
import 'text.dart';
import 'theme.dart';

class PdfOnlineResume extends StatelessWidget {
  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PdfTheme.largeVerticalSpace,
        Text(StringsProvider.strings.visitOnlineResume, style: PdfTheme.normalTextStyle),
        PdfTheme.tinyVerticalSpace,
        PdfLink(Strings.personalOnlineResumeLink + '.', Strings.personalOnlineResumeLink)
      ]
    );
  }
}