import 'package:flutter/widgets.dart';

import '../ui/card.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';
import '../ui/text/link.dart';

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
    final AppThemeData themeData = LayoutModel.theme.background;

    final Widget builtTitle = Text(
      title,
      style: themeData.overStyled1.normalText.bold,
      maxLines: 2,
      overflow: TextOverflow.ellipsis
    );

    Widget builtDetail = Text(
      detail,
      style: themeData.overStyled1.normalText.italic,
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
            themeData: themeData,
            alwaysShowTrailingIcon: true
          )
        ]
      );
    }

    return AppCard(
      padding: const AppEdgeInsets.normal(),
      enableHoverEffect: true,
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