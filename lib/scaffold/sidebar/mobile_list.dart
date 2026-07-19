import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/button/button.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/theme.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';

class MobileList extends Padding {
  MobileList(AppTheme theme, List<Widget> children)
    : super(
        padding: const AppEdgeInsets.normal(),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: theme.elementColor2,
          endForegroundColor: theme.elementColor2,
          child: LayoutBuilder(
            builder: (BuildContext builderContext, BoxConstraints builderConstraints) {
              return AppSliverScroller(
                [
                  SliverAppBar(
                    pinned: true,
                    stretch: true,
                    collapsedHeight: 76,
                    expandedHeight: builderConstraints.maxWidth,
                    backgroundColor: theme.elementColor1,
                    surfaceTintColor: Colors.transparent,
                    elevation: 12,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
                    automaticallyImplyLeading: false,
                    flexibleSpace: _Profile(builderContext, theme)
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

class _Profile extends Padding {
  _Profile(BuildContext context, AppTheme theme)
    : super(
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
                color: theme.overElement1Color1,
                onPressed: () => Navigator.pop(context)
              )
            )
          ]
        )
      );
}