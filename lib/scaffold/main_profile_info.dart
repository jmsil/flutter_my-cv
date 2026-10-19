import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';

enum MainProfileInfoStyle { compactAppbar, extendedAppbarBackground, extendedAppbarElement, body }

class MainProfileInfo extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String info;
  final MainProfileInfoStyle style;
  final bool softWrap;
  final bool hasIntrinsicWidth;

  MainProfileInfo.nameAndRoles({
    required this.style,
    required bool isShortRoles,
    this.softWrap = true
  }) :
    icon = null,
    title = Strings.personalName,
    info = isShortRoles
      ? Strings.shortRoles
      : StringsModel.strings.longRoles,
    hasIntrinsicWidth = true;

  MainProfileInfo.professionalSummary({
    this.icon,
    required this.style
  }) :
    title = StringsModel.strings.professionalSummaryTitle,
    info = StringsModel.strings.professionalSummaryInfo,
    softWrap = true,
    hasIntrinsicWidth = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    final double verticalSpacing;
    final TextStyle titleStyle;
    final TextStyle infoStyle;

    switch (style) {
      case MainProfileInfoStyle.compactAppbar:
        verticalSpacing = AppLayout.shortSpacing;
        titleStyle = theme.brand1.normalHeader.over1.bold;
        infoStyle = theme.brand1.normalText.over1.regular;
        break;
      case MainProfileInfoStyle.extendedAppbarBackground:
        verticalSpacing = AppLayout.smallSpacing;
        titleStyle = theme.background.largeHeader.over1.bold;
        infoStyle = theme.background.largeText.over1.regular;
        break;
      case MainProfileInfoStyle.extendedAppbarElement:
        verticalSpacing = AppLayout.smallSpacing;
        titleStyle = theme.brand1.largeHeader.over1.bold;
        infoStyle = theme.brand1.largeText.over1.regular;
        break;
      case MainProfileInfoStyle.body:
        verticalSpacing = AppLayout.normalSpacing;
        titleStyle = theme.background.xLargeHeader.over1.bold;
        infoStyle = theme.background.xLargeText.over1.regular;
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
      style == MainProfileInfoStyle.extendedAppbarBackground ||
      style == MainProfileInfoStyle.extendedAppbarElement)
    {
      builtInfoWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: builtInfoWidget
        )
      );
    }

    final Widget builtWidget = Column(
      spacing: verticalSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        builtTitleWidget,
        AppDivider(4, titleStyle.color!),
        builtInfoWidget
      ]
    );

    return hasIntrinsicWidth
      ? IntrinsicWidth(child: builtWidget)
      : builtWidget;
  }
}