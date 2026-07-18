import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/loading_button.dart';
import '../layout/layout.dart';
import '../layout/layout_provider.dart';
import '../theme/icons.dart';
import 'viewer.dart';

class ProjectTileWidget extends Row {
  ProjectTileWidget(Project project)
    : super(
        spacing: AppLayout.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            AppIcons.topicMark,
            color: LayoutProvider.theme.overBackgroundColor1
          ),
          Expanded(
            child: Column(
              spacing: AppLayout.shortSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: LayoutProvider.theme.normalOverBackgroundColor1BoldStyle
                ),
                Text(
                  project.description,
                  style: LayoutProvider.theme.normalOverBackgroundColor1Style
                )
              ]
            )
          ),
          AppProjectButton(project)
        ]
      );
}

abstract class Project {
  final String title;
  final String description;
  final String info;
  final AssetsArchive assets;
  final AppViewerKey viewerKey = AppViewerKey();

  Project(this.title, this.description, this.info, this.assets);

  List<Widget> buildPlaceholderWidgets();
}