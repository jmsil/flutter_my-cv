import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/button.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import 'project.dart';
import 'project_gallery_viewer.dart';
import 'project_info_viewer.dart';
import 'viewer.dart';

class AppProjectButton extends StatefulWidget {
  final Project project;

  AppProjectButton(this.project);

  @override
  _State createState() => _State();
}

class _State extends State<AppProjectButton> {
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final AppThemeDataBasicProperty themeProperty = LayoutModel.theme.background.accent1;
    return AppButton.icon(
      icon: widget.project is InfoProject ? AppIcons.info : AppIcons.gallery,
      themeProperty: themeProperty,
      isProcessing: isProcessing,
      onPressed: onPressed
    );
  }

  void onPressed() async {
    if (isProcessing)
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
    setState(() => isProcessing = value);
  }
}