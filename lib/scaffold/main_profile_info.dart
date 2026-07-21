import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings_provider.dart';

class MainProfileInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool isCompactMode;
  final bool isOverBackground;
  final bool softWrap;
  final bool hasIntrinsicWidth;

  MainProfileInfo.nameAndRoles({
    required this.isCompactMode,
    required bool isShortRoles,
    this.softWrap = true
  })
    : title = Strings.personalName,
      info = isShortRoles
        ? Strings.shortRoles
        : StringsProvider.strings.longRoles,
      isOverBackground = false,
      hasIntrinsicWidth = true;

  MainProfileInfo.professionalSummary({ required this.isOverBackground })
    : title = StringsProvider.strings.professionalSummaryTitle,
      info = StringsProvider.strings.professionalSummaryInfo,
      isCompactMode = false,
      softWrap = true,
      hasIntrinsicWidth = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;

    final titleStyle = isOverBackground
      ? isCompactMode
        ? theme.header1OverBackgroundColor1BoldStyle
        : theme.header2OverBackgroundColor1BoldStyle
      : isCompactMode
        ? theme.header1OverElement1Color1BoldStyle
        : theme.header2OverElement1Color1BoldStyle;

    final infoStyle = isOverBackground
      ? isCompactMode
        ? theme.text1OverBackgroundColor1Style
        : theme.text2OverBackgroundColor1Style
      : isCompactMode
        ? theme.text1OverElement1Color1Style
        : theme.text2OverElement1Color1Style;

    Widget builtWidget = Text(info, style: infoStyle, softWrap: softWrap);

    if ( ! isCompactMode && ! isOverBackground) {
      builtWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: builtWidget
        )
      );
    }

    builtWidget = Column(
      spacing: isCompactMode
        ? AppLayout.shortSpacing
        : isOverBackground
            ? AppLayout.normalSpacing
            : AppLayout.smallSpacing,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: titleStyle, softWrap: softWrap),
        AppDivider(4, titleStyle.color!),
        builtWidget
      ]
    );

    return hasIntrinsicWidth
      ? IntrinsicWidth(child: builtWidget)
      : builtWidget;
  }
}