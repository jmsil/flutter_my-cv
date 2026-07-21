import 'package:flutter/material.dart';

import '../../ui/layout/icons.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/text.dart';
import 'section.dart';

class DetailsSection extends Section {
  DetailsSection(AppTheme theme)
    : super(
        theme: theme,
        startOpen: true,
        title: StringsProvider.strings.detailsTitle,
        contentWidget: Column(
          spacing: AppLayout.normalSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(
              icon: AppIcons.local,
              text: StringsProvider.strings.personalLocation,
              textStyle: theme.text1OverSectionColor1Style
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