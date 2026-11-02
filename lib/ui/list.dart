import 'package:flutter/material.dart';
import 'package:my_cv/ui/text.dart';

import 'container.dart';
import 'layout/layout.dart';
import 'layout/theme.dart';

class AppList extends StatelessWidget {
  final List<String> list;
  final EdgeInsets? padding;
  final AppThemeData themeData;

  AppList({
    required this.list,
    this.padding,
    required this.themeData
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (String item in list) {
      children.add(AppContainer(
        padding: const EdgeInsets.only(
          left: 6, top: 6, right: AppLayout.normalSpacing, bottom: 6
        ),
        borderColor: themeData.overColor1.withDecorationAlpha,
        borderRadius: AppTheme.circleBorderRadius,
        child: AppIconText.bullet(
          text: item, textStyle: themeData.normalText.over1.regular, enableCompactIcon: true
        )
      ));
    }

    Widget builtWidget = Wrap(
      spacing: AppLayout.normalSpacing,
      runSpacing: AppLayout.normalSpacing,
      children: children
    );

    if (padding != null)
      builtWidget = Padding(padding: padding!, child: builtWidget);

    return builtWidget;
  }
}