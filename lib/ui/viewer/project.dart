import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/project_button.dart';
import '../layout/icons.dart';
import '../layout/layout.dart';
import '../layout/theme.dart';

class ProjectTileWidget extends Row {
  ProjectTileWidget(
    AppTheme theme, Project project
  ) : super(
    spacing: AppLayout.smallSpacing,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(AppIcons.topicMark, color: theme.background.overColor1),
      Expanded(
        child: Column(
          spacing: AppLayout.tinySpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: theme.background.normalText.over1.bold
            ),
            Text(
              project.description,
              style: theme.background.normalText.over1.regular
            )
          ]
        )
      ),
      AppProjectButton(project)
    ]
  );
}

class Project {
  final String title;
  final String description;
  final AssetsArchive assets;

  Project._(this.title, this.description, this.assets);
}

class GalleryProject extends Project {
  GalleryProject(
    String title, String description, GalleryAssetsArchive assets
  ) : super._(
    title, description, assets
  );
}

abstract class InfoProject extends Project {
  final String info;

  InfoProject(
    String title, String description, this.info, AssetsArchive assets
  ) : super._(
    title, description, assets
  );

  List<Widget> buildPlaceholderWidgets();
}