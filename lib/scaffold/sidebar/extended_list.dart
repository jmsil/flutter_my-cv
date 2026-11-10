import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_theme_model.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/appbar_model.dart';
import '../appbar/extended_appbar.dart';

class ExtendedList extends StatelessWidget {
  final List<Widget> children;

  ExtendedList(this.children);

  @override
  Widget build(BuildContext context) {
    final AppLayoutMode layoutMode = LayoutThemeModel.layoutMode;
    final AppTheme theme = LayoutThemeModel.theme;
    final double totalCollapsedHeight =
      AppbarModel.totalCollapsedHeightOf(context) + AppDimens.normal;
    final Color overlayColor = layoutMode.showSidebarBackground
      ? theme.brand2.surfaceColor1
      : theme.background.surfaceColor1;

    Widget builtWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startSize: AppTheme.radiusValue,
      startForegroundColor: overlayColor,
      endSize: AppTheme.radiusValue,
      endForegroundColor: overlayColor,
      child: AppListView(children: children)
    );

    builtWidget = layoutMode.isLeft
      ? Padding(
          padding: const AppEdgeInsets.normal(),
          child: Column(
            spacing: AppDimens.normal,
            children: [
              ExtendedAppbar(),
              Expanded(child: builtWidget)
            ]
          )
        )
      : AppbarAnimatedPadding(
          padding: AppEdgeInsets.normal(top: totalCollapsedHeight),
          child: builtWidget
        );

    return builtWidget;
  }
}