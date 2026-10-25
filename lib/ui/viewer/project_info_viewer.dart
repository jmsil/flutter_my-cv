import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import '../strings/strings.dart';
import 'project.dart';
import 'viewer.dart';

class ProjectInfoViewer extends AppViewer {
  final InfoProject project;

  ProjectInfoViewer(
    this.project
  ) : super(
    direction: Axis.vertical,
    windowWidth: 1560,
    barPadding: const AppEdgeInsets.large(vertical: AppEdgeInsets.xLargeValue)
  );

  @override
  _State createState() => _State();
}

class _State extends AppViewerState<ProjectInfoViewer> {
  @override
  Widget buildBar(AppThemeData themeData) {
    return Row(
      spacing: AppLayout.normalSpacing,
      children: [
        Icon(AppIcons.webhook, size: 64, color: themeData.overColor1),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.project.title, style: themeData.largeHeader.over1.bold),
              Text(widget.project.description, style: themeData.largeText.over1.regular)
            ]
          )
        ),
        AppButton.icon(
          icon: AppIcons.close,
          color: themeData.overColor1,
          onPressed: () => Navigator.pop(context)
        )
      ]
    );
  }

  @override
  Widget buildBody(AppThemeData themeData, double width, double height) {
    int widgetPlaceholderIndex = 0;
    final List<Widget> children = [];
    final List<Widget> placeholderWidgets = widget.project.buildPlaceholderWidgets();
    final List<String> infoLines = widget.project.info.split(Strings.splitTag);

    for (String infoLine in infoLines) {
      if (infoLine == Strings.widgetTag) {
        children.add(placeholderWidgets[widgetPlaceholderIndex]);
        children.add(AppLayout.normalVerticalSpacer);
        widgetPlaceholderIndex++;
      }
      else if (infoLine.startsWith(Strings.titleTag)) {
        infoLine = infoLine.replaceAll(Strings.titleTag, '');
        children.add(
          Text(infoLine, style: themeData.normalHeader.over1.bold)
        );
        children.add(AppLayout.smallVerticalSpacer);
      }
      else if (infoLine.isNotEmpty) {
        infoLine = infoLine.replaceAll('\n▪', '\n    ▪');
        children.add(
          Text(infoLine, style: themeData.normalText.over1.regular)
        );
        children.add(AppLayout.normalVerticalSpacer);
      }
    }

    return AppListView(
      padding: const AppEdgeInsets.normal(bottom: AppEdgeInsets.xLargeValue),
      children: children
    );
  }
}