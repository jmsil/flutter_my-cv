import 'package:flutter/widgets.dart';

import '../container.dart';
import '../layout/dimens.dart';
import '../layout/theme.dart';
import 'project.dart';
import 'project_button.dart';

class ProjectCard extends AppCard {
  ProjectCard(
    AppTheme theme, Project project
  ) : super(
    theme: theme,
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