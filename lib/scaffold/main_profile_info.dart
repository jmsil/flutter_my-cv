import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_theme_model.dart';
import '../ui/strings/strings_model.dart';

enum MainProfileInfoStyle { compactAppbar, extendedFlatAppbar, extendedTopAppbar, body }

class MainProfileInfo extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String info;
  final MainProfileInfoStyle style;
  final bool softWrap;
  final bool enableIntrinsicWidth;

  MainProfileInfo.nameAndRoles({
    required this.style,
    required bool isShortRoles,
    this.softWrap = true
  }) :
    this.icon = null,
    this.title = Strings.personalName,
    this.info = isShortRoles
      ? Strings.shortRoles
      : StringsModel.strings.longRoles,
    this.enableIntrinsicWidth = true;

  MainProfileInfo.professionalSummary({
    required bool hasIcon,
    required this.style,
  }) :
    this.icon = hasIcon ? AppIcons.summary : null,
    this.title = StringsModel.strings.professionalSummaryTitle,
    this.info = StringsModel.strings.professionalSummaryInfo,
    this.softWrap = true,
    this.enableIntrinsicWidth = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutThemeModel.theme;
    final double beforeDividerSpacing;
    final double afterDividerSpacing;
    final TextStyle titleStyle;
    final TextStyle infoStyle;

    switch (style) {
      case MainProfileInfoStyle.compactAppbar:
        beforeDividerSpacing = AppDimens.xSmall;
        afterDividerSpacing = AppDimens.xSmall;
        titleStyle = theme.appbar.overStyled1.normalHeader.bold;
        infoStyle = theme.appbar.overStyled1.normalText.regular;
        break;
      case MainProfileInfoStyle.extendedFlatAppbar:
        beforeDividerSpacing = AppDimens.small;
        afterDividerSpacing = 0;
        titleStyle = theme.background.overStyled1.xLargeHeader.bold;
        infoStyle = theme.background.overStyled1.largeText.regular;
        break;
      case MainProfileInfoStyle.extendedTopAppbar:
        beforeDividerSpacing = AppDimens.small;
        afterDividerSpacing = 0;
        titleStyle = theme.appbar.overStyled1.largeHeader.bold;
        infoStyle = theme.appbar.overStyled1.largeText.regular;
        break;
      case MainProfileInfoStyle.body:
        beforeDividerSpacing = AppDimens.normal;
        afterDividerSpacing = AppDimens.normal;
        titleStyle = theme.background.overStyled1.xLargeHeader.bold;
        infoStyle = theme.background.overStyled1.xLargeText.regular;
    }

    Widget builtTitleWidget = Text(title, style: titleStyle, softWrap: softWrap);

    if (style != MainProfileInfoStyle.compactAppbar && icon != null) {
      builtTitleWidget = Row(
        spacing: titleStyle.fontSize!,
        children: [
          Icon(icon, size: titleStyle.fontSize! * 2, color: titleStyle.color),
          builtTitleWidget
        ]
      );
    }

    Widget builtInfoWidget = Text(info, style: infoStyle, softWrap: softWrap);

    if (
      style == MainProfileInfoStyle.extendedFlatAppbar ||
      style == MainProfileInfoStyle.extendedTopAppbar)
    {
      builtInfoWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: builtInfoWidget
        )
      );
    }

    Widget builtWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        builtTitleWidget,
        SizedBox(height: beforeDividerSpacing),
        AppDivider(4, titleStyle.color!),

        if (afterDividerSpacing > 0)
          SizedBox(height: afterDividerSpacing),

        builtInfoWidget
      ]
    );

    if (enableIntrinsicWidth)
      builtWidget = IntrinsicWidth(child: builtWidget);

    return builtWidget;
  }
}