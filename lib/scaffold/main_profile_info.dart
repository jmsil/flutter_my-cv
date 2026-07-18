import 'package:flutter/material.dart';

import '../ui/divider.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';

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
    final titleStyle = isOverBackground
      ? isCompactMode
        ? LayoutProvider.theme.header1OverBackgroundColor1BoldStyle
        : LayoutProvider.theme.header2OverBackgroundColor1BoldStyle
      : isCompactMode
        ? LayoutProvider.theme.header1OverElement1Color1BoldStyle
        : LayoutProvider.theme.header2OverElement1Color1BoldStyle;

    final infoStyle = isOverBackground
      ? isCompactMode
        ? LayoutProvider.theme.text1OverBackgroundColor1Style
        : LayoutProvider.theme.text2OverBackgroundColor1Style
      : isCompactMode
        ? LayoutProvider.theme.text1OverElement1Color1Style
        : LayoutProvider.theme.text2OverElement1Color1Style;

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
        AppDivider(4),
        infoWidget
      ]
    );
  }
}