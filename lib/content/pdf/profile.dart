import 'package:pdf/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_provider.dart';
import 'text.dart';
import 'theme.dart';

class PdfProfile extends StatelessWidget {
  @override
  Widget build(Context context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image(MemoryImage(AppAssets.profilePhoto))
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: PdfTheme.normalSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PdfText(Strings.personalName, style: PdfTheme.largeTextBoldStyle),
                PdfText(StringsProvider.strings.longRoles, style: PdfTheme.normalTextStyle)
              ]
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: PdfTheme.normalSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PdfText(StringsProvider.strings.personalLocation, style: PdfTheme.normalTextStyle),
                PdfLink(Strings.personalPhone, Strings.personalPhoneLink),
                PdfLink(Strings.personalEmail, Strings.personalEmailLink),
                PdfLink(Strings.personalGitHubLink, Strings.personalGitHubLink)
              ]
            )
          )
        ]
      )
    );
  }
}