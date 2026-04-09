import 'package:flutter/material.dart';
import 'package:my_cv/ui/scroller.dart';

import '../button/button.dart';
import '../const.dart';
import '../container/container.dart';
import '../project.dart';
import '../theme.dart';

class AppProjectViewer extends StatelessWidget {
  final Project project;

  AppProjectViewer(this.project);

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = AppContainer(
      color: AppTheme.highDarkColor,
      padding: const ThemedEdgeInsets.large(),
      child: Row(
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
      )
    );

    final Widget childrenWidget = Expanded(
      child: AppListView(
        padding: const ThemedEdgeInsets.normal(),
        children: project.buildViewer()
      )
    );

    return Center(
      child: AppContainer(
        width: 1680,
        color: AppTheme.highLightColor,
        margin: const ThemedEdgeInsets.normal(),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: Column(
          children: [
            headerWidget,
            childrenWidget
          ]
        )
      )
    );
  }
}