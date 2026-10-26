import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/project_button.dart';
import '../container/container.dart';
import '../layout/edge_insets.dart';
import '../layout/layout.dart';
import '../layout/theme.dart';

class ProjectCard extends AppContainer {
  ProjectCard(
    AppTheme theme, Project project
  ) : super(
    width: 420,
    height: 126,
    padding: const AppEdgeInsets.small(),
    borderColor: theme.background.overColor1.withDecorationAlpha,
    borderRadius: AppTheme.allBorderRadius,
    child: Column(
      children: [
        Row(
          spacing: AppLayout.largeSpacing,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: AppEdgeInsets.smallValue),
                child: Text(project.title, style: theme.background.normalHeader.over1.bold)
              )
            ),
            AppProjectButton(project)
          ]
        ),
        Expanded(
          child: Padding(
            padding: const AppEdgeInsets.small(top: 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                project.description,
                style: theme.background.normalText.over1.regular,
                maxLines: 2,
                overflow: TextOverflow.ellipsis
              )
            )
          )
        )
      ]
    )
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