import 'package:flutter/material.dart';

import 'assets.dart';
import 'container/container.dart';
import 'container/rounded_overlay.dart';
import 'scroller.dart';
import 'theme.dart';

class AppGallery extends StatelessWidget {
  final AssetsFolder assetsFolder;

  AppGallery._(this.assetsFolder);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageWidgets = [];

    for (String fileName in assetsFolder.fileNames) {
      Widget imageWidget = ClipRRect(
        borderRadius: AppTheme.allBorderRadius,
        child: Image.asset(fileName)
      );
      imageWidgets.add(imageWidget);
      imageWidgets.add(AppTheme.xLargeHorizontalSpacing);
    }

    imageWidgets.removeLast();

    return Center(
      child: AppContainer(
        width: 1600,
        height: 900,
        color: AppTheme.lowDarkColor,
        margin: const ThemedEdgeInsets.large(),
        padding: const ThemedEdgeInsets.xLarge(),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.allBorderRadius,
        child: RoundedOverlay(
          direction: Axis.horizontal,
          radius: AppTheme.radiusValue,
          startColor: AppTheme.lowDarkColor,
          endColor: AppTheme.lowDarkColor,
          child: AppListView(
            scrollDirection: Axis.horizontal,
            children: imageWidgets
          )
        )
      )
    );
  }

  static void show(BuildContext context, AssetsFolder assetsFolder) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: AppTheme.navigatorBackgroundColor,
      transitionDuration: const Duration(milliseconds: 380),

      transitionBuilder: (transCtx, transAnim, transSecAnim, transChild) {
        return FadeUpwardsPageTransitionsBuilder().buildTransitions(
          null, transCtx, transAnim, transSecAnim, transChild
        );
      },

      pageBuilder: (pageCtx, pageAnim, pageSecAnim) {
        return AppGallery._(assetsFolder);
      }
    );
  }
}