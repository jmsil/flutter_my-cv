import 'package:flutter/material.dart';

import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/text.dart';
import '../../ui/theme/icons.dart';
import 'section.dart';

class DetailsSection extends Section {
  DetailsSection()
    : super(
        true,
        StringsProvider.strings.detailsTitle,
        Column(
          spacing: AppLayout.normalSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(
              icon: AppIcons.local,
              text: StringsProvider.strings.personalLocation,
              textStyle: LayoutProvider.theme.text1OverSectionColor1Style
            ),
            AppLink(
              icon: AppIcons.phone,
              text: Strings.personalPhone,
              link: Strings.personalPhoneLink,
              isOverBackground: false
            ),
            AppLink(
              icon: AppIcons.mail,
              text: Strings.personalEmail,
              link: Strings.personalEmailLink,
              isOverBackground: false
            ),
            AppLink(
              icon: AppIcons.code,
              text: Strings.personalGitHubLink,
              isOverBackground: false
            )
          ]
        )
      );
}