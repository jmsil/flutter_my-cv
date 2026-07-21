import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/strings/strings_provider.dart';

enum MainProfileInfoStyle {
  compact, normal, expanded;

  bool get isCompact => this == compact;
  bool get isNormal => this == normal;
  bool get isExpanded => this == expanded;
}

class MainProfileInfo extends StatelessWidget {
  final String title;
  final String info;
  final MainProfileInfoStyle style;
  final bool isOverBackground;
  final bool softWrap;
  final bool hasIntrinsicWidth;

  MainProfileInfo.nameAndRoles({
    required this.style,
    required bool isShortRoles,
    required this.isOverBackground,
    this.softWrap = true
  })
    : title = Strings.personalName,
      info = isShortRoles
        ? Strings.shortRoles
        : StringsProvider.strings.longRoles,
      hasIntrinsicWidth = true;

  MainProfileInfo.professionalSummary({
    required this.style,
    required this.isOverBackground
  })
    : title = StringsProvider.strings.professionalSummaryTitle,
      info = StringsProvider.strings.professionalSummaryInfo,
      softWrap = true,
      hasIntrinsicWidth = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;

    final titleStyle = isOverBackground
      ? style.isCompact
        ? theme.header1OverBackgroundColor1BoldStyle
        : theme.header2OverBackgroundColor1BoldStyle
      : style.isCompact
        ? theme.header1OverElement1Color1BoldStyle
        : theme.header2OverElement1Color1BoldStyle;

    final infoStyle = isOverBackground
      ? style.isCompact
        ? theme.text1OverBackgroundColor1Style
        : theme.text2OverBackgroundColor1Style
      : style.isCompact
        ? theme.text1OverElement1Color1Style
        : theme.text2OverElement1Color1Style;

    Widget builtWidget = Text(info, style: infoStyle, softWrap: softWrap);

    if (style.isExpanded) {
      builtWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: builtWidget
        )
      );
    }

    builtWidget = Column(
      spacing: style.isCompact
        ? AppLayout.shortSpacing
        : style.isNormal
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