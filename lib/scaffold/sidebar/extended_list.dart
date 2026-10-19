import 'package:flutter/widgets.dart';
import 'package:my_cv/scaffold/appbar/profile_photo.dart';

import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/appbar_model.dart';
import '../main_profile_info.dart';

class ExtendedList extends StatelessWidget {
  final List<Widget> children;

  ExtendedList(this.children);

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final double totalCollapsedHeight = AppbarModel.totalCollapsedHeightOf(context);
    final Color overlayColor = layout.showSidebarBackground
      ? theme.brand2.baseColor
      : theme.background.baseColor;

    Widget builtWidget = OverlayBar(
      radius: AppTheme.radiusValue,
      startForegroundColor: overlayColor,
      endForegroundColor: overlayColor,
      child: AppListView(children: children)
    );

    builtWidget = layout.isLeftLayout
      ? Column(
          children: [
            _Profile(theme),
            Expanded(
              child: Padding(
                padding: const AppEdgeInsets.normal(top: 0),
                child: builtWidget
              )
            )
          ]
        )
      : AppbarAnimatedPadding(
          padding: AppEdgeInsets.normal(top: totalCollapsedHeight),
          child: builtWidget
        );

    return builtWidget;
  }
}

class _Profile extends AppbarAnimatedContainer {
  _Profile(
    AppTheme theme
  ) : super(
    AppContainer(
      width: double.infinity,
      color: theme.brand1.baseColor,
      margin: const EdgeInsets.only(right: AppEdgeInsets.normalValue),
      borderRadius: BorderRadius.horizontal(
        left: const Radius.circular(ProfilePhotoAppbarStateSwitcher.circleRadiusSize),
        right: AppTheme.radius
      ),
      child: Row(
        children: [
          ProfilePhotoAppbarStateSwitcher(),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: AppbarAnimatedPadding(
                padding: const EdgeInsets.only(right: AppEdgeInsets.xLargeValue),
                topFactor: 0,
                bottomFactor: 1,
                child: AppbarAnimatedOpacity(
                  MainProfileInfo.nameAndRoles(
                    style: MainProfileInfoStyle.compactAppbar,
                    isShortRoles: true,
                    softWrap: false
                  )
                )
              )
            )
          )
        ]
      )
    )
  );
}