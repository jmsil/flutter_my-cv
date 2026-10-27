import 'package:flutter/material.dart';

import '../content/education.dart';
import '../content/experience.dart';
import '../content/items.dart';
import '../content/professional_dev.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/scroller.dart';
import 'appbar/appbar_model.dart';
import 'appbar/extended_appbar.dart';
import 'main_profile_info.dart';
import 'sidebar/sidebar.dart';

class ExtendedScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final double totalCollapsedHeight = AppbarModel.totalCollapsedHeightOf(context);

    Widget builtWidget = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1080),
        child:  AppCustomScrollView([
          ExperienceGroup(),
          EducationGroup(),
          ProfessionalDevelopmentGroup(),
          ItemsGroup.languages(),
          ItemsGroup.availability()
        ])
      )
    );

    builtWidget = layout.isLeftLayout
      ? Column(
          spacing: AppLayout.largeSpacing,
          children: [
            Padding(
              padding: const AppEdgeInsets.xLarge(top: AppEdgeInsets.normalValue),
              child: MainProfileInfo.professionalSummary(
                icon: AppIcons.summary,
                style: MainProfileInfoStyle.body
              )
            ),
            Expanded(child: builtWidget)
          ]
        )
      : AppbarAnimatedPadding(
          padding: EdgeInsets.only(top: totalCollapsedHeight),
          child: builtWidget
        );

    builtWidget = Row(
      spacing: AppLayout.normalSpacing,
      children: [
        AppSidebar(),
        Expanded(child: builtWidget)
      ]
    );

    if ( ! layout.isLeftLayout) {
      builtWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          builtWidget,
          ExtendedAppbar()
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: AppbarModel(builtWidget)
    );
  }
}