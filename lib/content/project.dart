import 'package:flutter/widgets.dart';

import '../ui/assets.dart';
import '../ui/button/loading_button.dart';
import '../ui/const.dart';
import '../ui/theme.dart';

abstract class Project {
  final String title;
  final String description;
  final ImageAssetsArchive assets;

  Project(this.title, this.description, this.assets);

  List<Widget> buildViewer();
}


class ProjectWidget extends Row {
  ProjectWidget(Project project)
    : super(
        spacing: AppTheme.smallSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            AppIcons.topicMark,
            color: AppTheme.darkColor
          ),
          Expanded(
            child: Column(
              spacing: AppTheme.shortSpacingValue,
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