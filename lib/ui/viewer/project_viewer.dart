import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../layout/edge_insets.dart';
import '../layout/layout.dart';
import '../strings/strings.dart';
import '../theme.dart';
import '../theme/icons.dart';
import 'project.dart';
import 'viewer.dart';

class AppProjectViewer extends StatelessWidget {
  final Project project;

  AppProjectViewer(this.project);

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = Row(
      spacing: AppLayout.normalSpacing,
      children: [
        Icon(
          AppIcons.webhook,
          size: 64,
          color: AppTheme.xxLargeLightBlueBoldStyle.color
        ),
        Expanded(
          child: Column(
            spacing: AppLayout.smallSpacing,
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

    int widgetPlaceholderIndex = 0;
    final List<Widget> children = [];
    final List<Widget> placeholderWidgets = project.buildPlaceholderWidgets();
    final List<String> infoLines = project.info.split(Strings.splitTag);

    for (String infoLine in infoLines) {
      if (infoLine == Strings.widgetTag) {
        children.add(placeholderWidgets[widgetPlaceholderIndex]);
        children.add(AppLayout.normalVerticalSpacer);
        widgetPlaceholderIndex++;
      }
      else if (infoLine.startsWith(Strings.titleTag)) {
        infoLine = infoLine.replaceAll(Strings.titleTag, '');
        children.add(Text(infoLine, style: AppTheme.largeDarkBoldStyle));
        children.add(AppLayout.smallVerticalSpacer);
      }
      else if (infoLine.isNotEmpty) {
        children.add(Text(infoLine, style: AppTheme.darkStyle));
        children.add(AppLayout.normalVerticalSpacer);
      }
    }

    return AppViewer(
      key: project.viewerKey,
      direction: Axis.vertical,
      windowWidth: 1680,
      barPadding: const AppEdgeInsets.large(vertical: AppEdgeInsets.xLargeValue),
      bodyIsTransparent: false,
      barWidget: headerWidget,
      bodyWidget: AppScrollView(
        padding: const AppEdgeInsets.normal(bottom: AppEdgeInsets.xLargeValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
        )
      )
    );
  }
}