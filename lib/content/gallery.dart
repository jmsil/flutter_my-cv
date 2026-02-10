import 'package:flutter/material.dart';
import 'package:my_cv/ui/const.dart';

import '../ui/assets.dart';
import '../ui/container/container.dart';
import '../ui/scroller.dart';
import '../ui/theme.dart';

class AppGallery extends StatefulWidget {
  final AssetsFolder assetsFolder;

  AppGallery._(this.assetsFolder);

  @override
  _State createState() => _State();

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

class _State extends State<AppGallery> {
  late final Future<void> future;

  @override
  void initState() {
    super.initState();
    future = widget.assetsFolder.precache(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppContainer(
        width: 1600,
        height: 900,
        color: AppTheme.midDarkColor,
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(36),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.appThemeRadius,
        child: FutureBuilder(future: future, builder: futureBuilder)
      ),
    );
  }

  Widget futureBuilder(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: SizedBox(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(
            color: AppTheme.lightBlue,
            strokeWidth: 4,
            backgroundColor: AppTheme.lightBlue.withValues(alpha: 0.26)
          )
        ),
      );
    }

    List<Widget> imageWidgets = [];

    for (String fileName in widget.assetsFolder.fileNames) {
      Widget imageWidget = ClipRRect(
        borderRadius: AppTheme.appThemeRadius,
        child: Image.asset(fileName)
      );
      imageWidgets.add(imageWidget);
      imageWidgets.add(AppUiConst.hsep36);
    }

    imageWidgets.removeLast();

    return AppListView(
      scrollDirection: Axis.horizontal,
      children: imageWidgets
    );
  }
}