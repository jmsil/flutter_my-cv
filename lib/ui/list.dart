import 'package:flutter/material.dart';

import 'container.dart';
import 'layout/dimens.dart';
import 'layout/layout_model.dart';
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
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [];

    for (String item in list) {
      children.add(AppContainer(
        color: theme.brand3.baseColor.withCardFillAlpha,
        padding: const EdgeInsets.only(
          left: 6, top: 6, right: AppDimens.normal, bottom: 6),
        borderColor: theme.brand3.baseColor.withCardBorderAlpha,
        borderRadius: AppTheme.circleBorderRadius,
        child: AppIconText.bullet(
          text: item,
          textStyle: theme.background.normalText.over1.regular,
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