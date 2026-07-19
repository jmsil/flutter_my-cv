import 'package:flutter/material.dart';

import '../assets.dart';
import '../layout/icons.dart';
import '../layout/layout_provider.dart';
import '../layout/theme.dart';
import '../viewer/gallery_viewer.dart';
import '../viewer/project.dart';
import '../viewer/project_viewer.dart';
import '../viewer/viewer.dart';
import 'button.dart';

class AppProjectButton extends _LoadingButton {
  final Project project;

  AppProjectButton(this.project)
    : super(project.assets);

  @override
  void showViewer(BuildContext context) {
    AppViewer.show(context, AppProjectViewer(project));
  }
}

class AppGalleryButton extends _LoadingButton {
  AppGalleryButton(GalleryAssets assets)
    : super(assets);

  @override
  void showViewer(BuildContext context) {
    AppViewer.show(context, AppGallery(assets as GalleryAssets));
  }
}

abstract class _LoadingButton extends StatefulWidget {
  final AssetsArchive assets;

  _LoadingButton(this.assets);

  void showViewer(BuildContext context);

  @override
  _State createState() => _State();
}

class _State extends State<_LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    return AppButton.icon(
      icon: AppIcons.plus,
      color: theme.overBackgroundColor2,
      isLoading: isLoading,
      isSelected: true,
      onPressed: onPressed
    );
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