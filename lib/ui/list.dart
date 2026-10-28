import 'package:flutter/material.dart';

import 'container/container.dart';
import 'layout/edge_insets.dart';
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
        padding: const AppEdgeInsets.small(
          left: AppLayout.smallSpacing, right: AppLayout.normalSpacing),
        borderColor: themeData.overColor1.withDecorationAlpha,
        borderRadius: AppTheme.circleBorderRadius,
        child: Text('▪ $item', style: themeData.normalText.over1.regular)
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