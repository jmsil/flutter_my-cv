import 'package:flutter/material.dart';

import '../ui/container.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/layout_theme_model.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text.dart';

class ProfessionalDevelopmentCard extends StatelessWidget {
  final String title;
  final String detail;
  final String? certificateLink;

  ProfessionalDevelopmentCard(
    this.title,
    this.detail,
    {
      this.certificateLink
    }
  );

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutThemeModel.theme;

    final Widget builtTitle = Text(
      title,
      style: theme.background.overStyled1.normalText.bold,
      maxLines: 2,
      overflow: TextOverflow.ellipsis
    );

    Widget builtDetail = Text(
      detail,
      style: theme.background.overStyled1.normalText.italic,
      maxLines: 1,
      overflow: TextOverflow.ellipsis
    );

    if (certificateLink != null) {
      builtDetail = Row(
        spacing: AppDimens.normal,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: builtDetail),
          AppLink(
            text: StringsModel.strings.verify,
            link: certificateLink,
            alwaysShowTrailingIcon: true
          )
        ]
      );
    }

    return AppCard(
      theme: theme,
      padding: const AppEdgeInsets.normal(),
      child: Column(
        spacing: certificateLink == null
          ? AppDimens.small
          : AppDimens.normal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          builtTitle,
          builtDetail
        ]
      )
    );
  }
}