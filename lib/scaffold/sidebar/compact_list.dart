import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/button/button.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/theme.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';

class CompactList extends Padding {
  CompactList(
    AppTheme theme, List<Widget> children
  ) : super(
    padding: const AppEdgeInsets.normal(),
    child: OverlayBar(
      radius: AppTheme.radiusValue,
      startSize: AppTheme.radiusValue,
      startForegroundColor: theme.brand2.surfaceColor,
      endSize: AppTheme.radiusValue,
      endForegroundColor: theme.brand2.surfaceColor,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return AppCustomScrollView([
            SliverAppBar(
              pinned: true,
              stretch: true,
              collapsedHeight: 76,
              expandedHeight: constraints.maxWidth,
              backgroundColor: theme.brand1.surfaceColor,
              surfaceTintColor: Colors.transparent,
              elevation: 12,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
              automaticallyImplyLeading: false,
              flexibleSpace: _Profile(context, theme)
            ),

            SliverList(
              delegate: SliverChildListDelegate(
                children,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false
              )
            )
          ]);
        }
      )
    )
  );
}

class _Profile extends Padding {
  _Profile(
    BuildContext context, AppTheme theme
  ) : super(
    padding: const EdgeInsets.all(AppDimens.large / 2),
    child: Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Center(
          child: ProfilePhoto(margin: AppDimens.small)
        ),
        Align(
          alignment: Alignment.topLeft,
          child: AppButton.icon(
            icon: AppIcons.back,
            themeProperty: theme.brand1.over1,
            onPressed: () => Navigator.pop(context)
          )
        )
      ]
    )
  );
}