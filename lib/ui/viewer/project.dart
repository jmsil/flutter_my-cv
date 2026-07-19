import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/loading_button.dart';
import '../layout/icons.dart';
import '../layout/layout.dart';
import '../layout/theme.dart';
import 'viewer.dart';

class ProjectTileWidget extends Row {
  ProjectTileWidget(AppTheme theme, Project project)
    : super(
        spacing: AppLayout.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(AppIcons.topicMark, color: theme.overBackgroundColor1),
          Expanded(
            child: Column(
              spacing: AppLayout.shortSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: theme.text1OverBackgroundColor1BoldStyle
                ),
                Text(
                  project.description,
                  style: theme.text1OverBackgroundColor1Style
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