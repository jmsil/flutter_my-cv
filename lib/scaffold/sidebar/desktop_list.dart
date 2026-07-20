import 'package:flutter/widgets.dart';

import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/theme.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/animated_padding.dart';
import '../appbar/state_provider.dart';

class DesktopList extends AppbarAnimatedPadding {
  DesktopList(AppLayout layout, List<Widget> children)
    : super(
        padding: AppEdgeInsets.normal(top: AppbarStateProvider.totalCollapsedHeight),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: _getOverlayColor(layout),
          endForegroundColor: _getOverlayColor(layout),
          child: AppListView(
            children: children
          )
        )
      );

  static Color _getOverlayColor(AppLayout layout) {
    return layout.hasSidebar ? layout.theme.elementColor2 : layout.theme.backgroundColor;
  }
}