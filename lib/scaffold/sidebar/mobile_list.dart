import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/button/button.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../../ui/theme.dart';
import '../../ui/theme/icons.dart';

class MobileList extends Padding {
  MobileList(List<Widget> children)
    : super(
        padding: const AppEdgeInsets.normal(),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: AppTheme.lowDarkColor,
          child: LayoutBuilder(
            builder: (BuildContext builderContext, BoxConstraints builderConstraints) {
              return AppSliverScroller(
                [
                  SliverAppBar(
                    pinned: true,
                    stretch: true,
                    collapsedHeight: 76,
                    expandedHeight: builderConstraints.maxWidth,
                    backgroundColor: AppTheme.highDarkColor,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: AppTheme.highDarkColor,
                    shape: const RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
                    automaticallyImplyLeading: false,
                    flexibleSpace: _Profile()
                  ),

                  SliverList(
                    delegate: SliverChildListDelegate(children)
                  )
                ]
              );
            }
          )
        )
      );
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppEdgeInsets.largeValue / 2),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ProfilePhoto(margin: AppEdgeInsets.smallValue)
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppButton.icon(
              icon: AppIcons.back,
              onPressed: () => Navigator.pop(context)
            )
          )
        ]
      )
    );
  }
}