import 'package:flutter/widgets.dart';

import '../assets.dart';
import '../button/project_button.dart';
import '../container.dart';
import '../layout/dimens.dart';
import '../layout/theme.dart';

class ProjectCard extends AppContainer {
  ProjectCard(
    AppTheme theme, Project project
  ) : super(
    color: theme.brand3.surfaceColor.withCardFillAlpha,
    borderColor: theme.brand3.surfaceColor.withCardBorderAlpha,
    borderRadius: AppTheme.allBorderRadius,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const AppEdgeInsets.small(left: AppDimens.normal),
          child: Row(
            spacing: AppDimens.large,
            children: [
              Expanded(
                child: Text(
                  project.title,
                  style: theme.background.overStyled1.normalHeader.bold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                )
              ),
              AppProjectButton(project)
            ]
          )
        ),
        Padding(
          padding: const AppEdgeInsets.normal(top: 0),
          child: Text(
            project.description,
            style: theme.background.overStyled1.normalText.regular,
            maxLines: 2,
            overflow: TextOverflow.ellipsis
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