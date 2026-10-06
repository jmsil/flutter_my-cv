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
        PdfTheme.xxLargeVerticalSpace,
        Text(StringsProvider.strings.visitOnlineResume, style: PdfTheme.largeTextStyle),
        PdfTheme.smallVerticalSpace,
        PdfLink(Strings.personalOnlineResumeLink + '.', Strings.personalOnlineResumeLink)
      ]
    );
  }
}