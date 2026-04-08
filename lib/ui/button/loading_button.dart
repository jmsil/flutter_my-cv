import 'package:flutter/material.dart';

import '../../content/project.dart';
import '../assets.dart';
import '../const.dart';
import '../container/container.dart';
import '../gallery.dart';
import '../theme.dart';
import 'button.dart';

class AppProjectButton extends _LoadingButton {
  final Project project;

  AppProjectButton(this.project)
    : super(project.assets);

  @override
  Widget build(bool isLoading, Function() onPressed) {
    return AppButton.icon(
      icon: AppIcons.plus,
      color: AppTheme.darkColor,
      isLoading: isLoading,
      onPressed: onPressed
    );
  }

  @override
  void showViewer(BuildContext context) {
    // TODO: implement showWindow
  }
}


class AppGalleryButton extends _LoadingButton {
  AppGalleryButton(GalleryAssets assets)
    : super(assets);

  @override
  Widget build(bool isLoading, Function() onPressed) {
    final child = SizedBox(
      width: 84,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.memory(AppAssets.imageSlider, fit: BoxFit.fill),

          if (isLoading)
            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: AppContainer(
                  color: AppTheme.lightBlue,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    color: AppTheme.darkBlue,
                    strokeWidth: 3,
                    backgroundColor: AppTheme.darkBlue.withValues(alpha: 0.26)
                  )
                )
              )
            )
        ]
      )
    );

    return AppContainer(
      borderColor: AppTheme.lightBlue,
      borderRadius: AppTheme.allBorderRadius,
      isClipped: true,
      child: AppInkResponse(
        padding: const EdgeInsets.all(12),
        effectsColor: AppButton.effectsColor,
        onPressed: onPressed,
        child: child
      )
    );
  }

  @override
  void showViewer(BuildContext context) {
    AppGallery.show(context, assets as GalleryAssets);
  }
}



abstract class _LoadingButton extends StatefulWidget {
  final ImageAssetsArchive assets;

  _LoadingButton(this.assets);

  Widget build(bool isLoading, Function() onPressed);
  void showViewer(BuildContext context);

  @override
  _State createState() => _State();
}


class _State extends State<_LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return widget.build(isLoading, onPressed);
  }

  void onPressed() async {
    if (isLoading)
      return;

    if (widget.assets.count == 0) {
      setState(() => isLoading = true);

      try {
        await widget.assets.load();
      }
      finally {
        setState(() => isLoading = false);
      }
    }

    widget.showViewer(context);
  }
}