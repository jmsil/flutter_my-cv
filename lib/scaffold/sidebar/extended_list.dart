import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/appbar_model.dart';
import '../appbar/extended_appbar.dart';

class ExtendedList extends StatelessWidget {
  final List<Widget> children;

  ExtendedList(this.children);

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final double totalCollapsedHeight =
      AppbarModel.totalCollapsedHeightOf(context) + AppDimens.normal;
    final Color overlayColor = layout.showSidebarBackground
      ? theme.brand2.baseColor
      : theme.background.baseColor;

    Widget builtWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startSize: AppTheme.radiusValue,
      startForegroundColor: overlayColor,
      endSize: AppTheme.radiusValue,
      endForegroundColor: overlayColor,
      child: AppListView(children: children)
    );

    builtWidget = layout.isLeftLayout
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