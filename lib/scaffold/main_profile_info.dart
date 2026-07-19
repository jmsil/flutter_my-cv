import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/theme/theme.dart';

class MainProfileInfo extends StatelessWidget {
  final String title;
  final String info;
  final bool isCompactMode;
  final bool isOverBackground;

  MainProfileInfo({
    required this.title,
    required this.info,
    required this.isCompactMode,
    required this.isOverBackground
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.providerTheme;
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

    Widget infoWidget = Text(info, style: infoStyle);

    if ( ! isCompactMode) {
      infoWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: infoWidget
        )
      );
    }

    return Column(
      spacing: AppLayout.smallSpacing / (isCompactMode ? 2 : 1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        AppDivider(theme, 4),
        infoWidget
      ]
    );
  }
}