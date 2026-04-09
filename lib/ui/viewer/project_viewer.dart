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
    final Widget headerWidget = SliverFloatingHeader(
      child: AppContainer(
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
      )
    );

    return Center(
      child: AppContainer(
        width: 1600,
        color: AppTheme.highLightColor,
        margin: const EdgeInsets.symmetric(
          vertical: ThemedEdgeInsets.normalValue * 3,
          horizontal: ThemedEdgeInsets.normalValue
        ),
        borderColor: AppTheme.lightBlue,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: AppSliverScroller(
          [
            headerWidget,
            SliverPadding(
              padding: const ThemedEdgeInsets.normal(),
              sliver: SliverList(
                delegate: SliverChildListDelegate(project.buildViewer())
              ),
            )
          ]
        )
      )
    );
  }
}