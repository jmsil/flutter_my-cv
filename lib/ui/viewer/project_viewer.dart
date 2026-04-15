import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../const.dart';
import '../strings/strings.dart';
import '../theme.dart';
import 'project.dart';
import 'viewer.dart';

class AppProjectViewer extends StatelessWidget {
  final Project project;

  AppProjectViewer(this.project);

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = Row(
      spacing: AppTheme.normalSpacingValue,
      children: [
        Icon(
          AppIcons.webhook,
          size: 64,
          color: AppTheme.xxLargeLightBlueBoldStyle.color
        ),
        Expanded(
          child: Column(
            spacing: AppTheme.smallSpacingValue,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(project.title, style: AppTheme.xxLargeLightBlueBoldStyle),
              Text(project.description, style: AppTheme.highLightBlueStyle)
            ]
          )
        ),
        AppButton.icon(
          icon: AppIcons.close,
          onPressed: () => Navigator.pop(context)
        )
      ]
    );

    int widgetIndex = 0;
    final List<Widget> children = [];
    final List<Widget> widgets = project.buildWidgets();
    final List<String> infoLines = project.info.split(Strings.stringBreak);

    for (String infoLine in infoLines) {
      if (infoLine == Strings.widgetPlaceholder) {
        children.add(widgets[widgetIndex]);
        widgetIndex++;
      }
      else if (infoLine.isNotEmpty) {
        Widget textWidget = Text(infoLine, style: AppTheme.darkStyle);
        children.add(textWidget);
      }
    }

    return AppViewer(
      direction: Axis.vertical,
      windowWidth: 1680,
      barPadding: const EdgeInsets.symmetric(
        vertical: ThemedEdgeInsets.xLargeValue,
        horizontal: ThemedEdgeInsets.largeValue
      ),
      bodyIsTransparent: false,
      barWidget: headerWidget,
      bodyWidget: AppScrollView(
        padding: const ThemedEdgeInsets.normal(bottom: ThemedEdgeInsets.xLargeValue),
        child: Column(
          spacing: AppTheme.normalSpacingValue,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
        )
      )
    );
  }
}