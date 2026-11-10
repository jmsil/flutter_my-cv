import 'package:flutter/material.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text.dart';
import 'section.dart';

class SectionDetails extends Section {
  SectionDetails() : super(
    startOpen: true,
    title: StringsModel.strings.detailsTitle,
    child: Column(
      spacing: AppDimens.normal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIconText(
          icon: AppIcons.local,
          text: StringsModel.strings.personalLocation,
          textStyle: LayoutModel.theme.sidebar.overStyled1.normalText.regular
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