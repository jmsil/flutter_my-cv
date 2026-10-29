import 'package:flutter/material.dart';

import '../ui/container/container.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout_model.dart';
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
    final AppTheme theme = context.appLayout.theme;
    Widget builtDetail = Text(
      detail,
      style: theme.background.normalText.over1.italic,
      maxLines: 1,
      overflow: TextOverflow.ellipsis
    );

    if (certificateLink != null) {
      builtDetail = Row(
        spacing: AppLayout.normalSpacing,
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

    return AppContainer(
      padding: const AppEdgeInsets.normal(),
      borderColor: theme.background.overColor1.withDecorationAlpha,
      borderRadius: AppTheme.allBorderRadius,
      child: Column(
        spacing: certificateLink == null
          ? AppLayout.smallSpacing
          : AppLayout.normalSpacing,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: theme.background.normalText.over1.bold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis
          ),
          builtDetail
        ]
      )
    );
  }
}