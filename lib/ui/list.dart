import 'package:flutter/widgets.dart';

import 'card.dart';
import 'layout/dimens.dart';
import 'layout/layout_model.dart';
import 'text/icon_text.dart';

class AppList extends StatelessWidget {
  final List<String> list;
  final EdgeInsets? padding;

  AppList({
    required this.list,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    final List<Widget> children = [];

    for (String item in list) {
      children.add(AppCard(
        padding: const AppEdgeInsets(all: 6, right: AppDimens.normal),
        borderRadius: AppTheme.circleBorderRadius,
        child: AppIconText.bullet(
          text: item,
          textStyle: themeData.overStyled1.normalText.regular,
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