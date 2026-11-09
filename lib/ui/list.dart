import 'package:flutter/material.dart';

import 'container.dart';
import 'layout/dimens.dart';
import 'layout/layout_theme_model.dart';
import 'text.dart';

class AppList extends StatelessWidget {
  final List<String> list;
  final EdgeInsets? padding;

  AppList({
    required this.list,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutThemeModel.theme;
    final List<Widget> children = [];

    for (String item in list) {
      children.add(AppCard(
        theme: theme,
        padding: const AppEdgeInsets(all: 6, right: AppDimens.normal),
        borderRadius: AppTheme.circleBorderRadius,
        child: AppIconText.bullet(
          text: item,
          textStyle: theme.background.overStyled1.normalText.regular,
          enableCompactIcon: true
        )
      ));
    }

    Widget builtWidget = Wrap(
      spacing: AppDimens.normal,
      runSpacing: AppDimens.normal,
      children: children
    );

    if (padding != null)
      builtWidget = Padding(padding: padding!, child: builtWidget);

    return builtWidget;
  }
}