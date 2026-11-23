import 'package:pdf/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import 'divider.dart';
import 'text.dart';
import 'theme.dart';

class PdfProfile extends StatelessWidget {
  final bool addCvLink;

  PdfProfile({required this.addCvLink});

  @override
  Widget build(Context context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          ClipOval(child: Image(MemoryImage(AppAssets.profilePhoto))),
          PdfTheme.xLargeSpacerH,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: PdfTheme.normalDimen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PdfText(Strings.personalName, style: PdfTheme.xLargeTextBoldStyle),
                  PdfText(
                    StringsModel.strings.roles.replaceAll('\n', Strings.pipeJoiner),
                    style: PdfTheme.normalTextStyle
                  ),
                  PdfDivider(),
                  Wrap(
                    spacing: PdfTheme.smallDimen,
                    runSpacing: PdfTheme.xSmallDimen,
                    children: [
                      PdfText(
                        StringsModel.strings.personalLocation, style: PdfTheme.normalTextStyle),
                      PdfText(Strings.pipeJoiner, style: PdfTheme.normalTextStyle),
                      PdfLink(Strings.personalPhone, Strings.personalPhoneLink, false),
                      PdfText(Strings.pipeJoiner, style: PdfTheme.normalTextStyle),
                      PdfLink(Strings.personalEmail, Strings.personalEmailLink, false),
                      PdfText(Strings.pipeJoiner, style: PdfTheme.normalTextStyle),
                      PdfLink(Strings.personalGitHubLink, Strings.personalGitHubLink, false),

                      if (addCvLink) ...[
                        PdfText(Strings.pipeJoiner, style: PdfTheme.normalTextStyle),
                        PdfLink(Strings.personalCvLink, Strings.personalCvLink, false)
                      ]
                    ]
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}