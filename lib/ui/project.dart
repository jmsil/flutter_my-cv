import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import 'assets.dart';
import 'button/loading_button.dart';
import 'const.dart';
import 'container/container.dart';
import 'theme.dart';

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


class ProjectImageWidget extends AppContainer {
  ProjectImageWidget(Uint8List imageData, {required hasTopMargin})
    : super(
        margin: EdgeInsets.only(
          top: hasTopMargin ? AppTheme.xLargeSpacingValue : 0,
          bottom: AppTheme.xLargeSpacingValue
        ),
        borderColor: AppTheme.lightBlue.withValues(alpha: 0.32),
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: Image.memory(imageData)
      );
}


abstract class Project {
  final String title;
  final String description;
  final ImageAssetsArchive assets;

  Project(this.title, this.description, this.assets);

  List<Widget> buildViewer();
}