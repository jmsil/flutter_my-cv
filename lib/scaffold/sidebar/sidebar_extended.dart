import 'package:flutter/widgets.dart';

import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/appbar_extended.dart';

class AppSidebarExtended extends StatelessWidget {
  final List<Widget> children;

  AppSidebarExtended(this.children);

  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppTheme theme = LayoutModel.theme;
    final Color overlayColor = layoutMode.showSidebarBackground
      ? theme.sidebar.surfaceColor1
      : theme.background.surfaceColor1;

    Widget builtWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startSize: AppTheme.radiusValue,
      startForegroundColor: overlayColor,
      endSize: AppTheme.radiusValue,
      endForegroundColor: overlayColor,
      child: AppListView(children: children)
    );

    if (layoutMode.isLeft) {
      builtWidget = Column(
        spacing: AppDimens.normal,
        children: [
          AppbarExtended(),
          Expanded(child: builtWidget)
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: builtWidget
    );
  }
}