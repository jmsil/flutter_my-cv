import 'package:flutter/material.dart';

import '../assets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../viewer/project_gallery_viewer.dart';
import '../viewer/project.dart';
import '../viewer/project_info_viewer.dart';
import '../viewer/viewer.dart';
import 'button.dart';

class AppProjectButton extends StatefulWidget {
  final Project project;

  AppProjectButton(this.project);

  @override
  _State createState() => _State();
}

class _State extends State<AppProjectButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.appLayout.theme;
    return AppButton.icon(
      icon: AppIcons.info,
      color: theme.overBackgroundColor2,
      isLoading: isLoading,
      onPressed: onPressed
    );
  }

  void onPressed() async {
    if (isLoading)
      return;

    if (widget.project.assets.count == 0) {
      setIsLoading(true);

      try {
        await widget.project.assets.load();
      }
      finally {
        setIsLoading(false);
      }
    }

    if (widget.project is InfoProject)
      AppViewer.show(context, ProjectInfoViewer(widget.project as InfoProject));
    else
      AppViewer.show(context, ProjectGalleryViewer(widget.project.assets as GalleryAssetsArchive));
  }

  void setIsLoading(bool value) {
    setState(() => isLoading = value);
  }
}