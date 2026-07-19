import 'package:flutter/widgets.dart';

import '../../ui/layout/edge_insets.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../../ui/theme/theme.dart';
import '../appbar/animated_padding.dart';
import '../appbar/state_provider.dart';

class DesktopList extends AppbarAnimatedPadding {
  DesktopList(AppTheme theme, List<Widget> children)
    : super(
        padding: AppEdgeInsets.normal(top: AppbarStateProvider.totalCollapsedHeight),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: theme.elementColor2,
          endForegroundColor: theme.elementColor2,
          child: AppListView(
            children: children
          )
        )
      );
}