import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout_provider.dart';
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
        titleStyle = theme.header1OverElement1Color1BoldStyle;
        infoStyle = theme.text1OverElement1Color1Style;
        break;
      case MainProfileInfoStyle.extendedAppbarBackground:
        verticalSpacing = AppLayout.smallSpacing;
        titleStyle = theme.header2OverBackgroundColor1BoldStyle;
        infoStyle = theme.text2OverBackgroundColor1Style;
        break;
      case MainProfileInfoStyle.extendedAppbarElement:
        verticalSpacing = AppLayout.smallSpacing;
        titleStyle = theme.header2OverElement1Color1BoldStyle;
        infoStyle = theme.text2OverElement1Color1Style;
        break;
      case MainProfileInfoStyle.body:
        verticalSpacing = AppLayout.normalSpacing;
        titleStyle = theme.header3OverBackgroundColor1BoldStyle;
        infoStyle = theme.text3OverBackgroundColor1Style;
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