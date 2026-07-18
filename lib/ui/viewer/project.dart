import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/loading_button.dart';
import '../layout/layout.dart';
import '../theme.dart';
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
            color: AppTheme.darkColor
          ),
          Expanded(
            child: Column(
              spacing: AppLayout.shortSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.title, style: AppTheme.darkBoldStyle),
                Text(project.description, style: AppTheme.darkStyle)
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