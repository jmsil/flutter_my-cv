import 'package:flutter/widgets.dart';

import '../../ui/layout/edge_insets.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../../ui/theme.dart';
import '../appbar/animated_padding.dart';
import '../appbar/state_provider.dart';

class DesktopList extends AppbarAnimatedPadding {
  DesktopList(List<Widget> children)
    : super(
        padding: AppEdgeInsets.normal(top: AppbarStateProvider.totalCollapsedHeight),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: AppTheme.lowDarkColor,
          child: AppListView(
            children: children
          )
        )
      );
}