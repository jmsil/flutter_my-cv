import 'package:flutter/material.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text.dart';
import 'section.dart';

class DetailsSection extends Section {
  DetailsSection(AppTheme theme) : super(
    theme: theme,
    startOpen: true,
    title: StringsModel.strings.detailsTitle,
    contentWidget: Column(
      spacing: AppDimens.normal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIconText(
          icon: AppIcons.local,
          text: StringsModel.strings.personalLocation,
          textStyle: theme.sidebarSection.overStyled1.normalText.regular
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