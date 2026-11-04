import 'package:flutter/material.dart';

import '../../ui/container.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../device.dart';
import 'about_section.dart';
import 'compact_list.dart';
import 'details_section.dart';
import 'extended_list.dart';
import 'settings.dart';
import 'skills_section.dart';

class AppSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final List<Widget> children = [
      if ( ! isExtendedScreen)
        AppSpacing.normalV,

      DetailsSection(theme),
      AppSpacing.normalV,

      SkillsSection.programming(),
      AppSpacing.normalV,

      SkillsSection.integration(),
      AppSpacing.normalV,

      AboutSection(theme)
    ];

    final Widget footerWidget = AppContainer(
      color: layout.showSidebarBackground ? theme.brand1.baseColor : null,
      padding: const AppEdgeInsets.normal(vertical: AppDimens.small),
      child: Row(
        spacing: AppDimens.small,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(
              StringsModel.strings.madeWithFlutter,
              style: layout.showSidebarBackground
                ? theme.brand1.normalText.over1.regular
                : theme.background.normalText.over1.regular
            )
          ),
          Settings()
        ]
      )
    );

    final Widget builtChild = Column(
      children: [
        Expanded(
          child: isExtendedScreen
            ? ExtendedList(children)
            : CompactList(theme, children)
        ),
        footerWidget
      ]
    );

    return layout.showSidebarBackground
      ? AppContainer(
          width: AppLayout.sidebarWidth,
          color: theme.brand2.baseColor,
          borderRadius: isExtendedScreen
            ? AppTheme.allBorderRadius
            : BorderRadius.zero,
          enableClip: isExtendedScreen,
          child: builtChild
        )
      : AppContainer(
          width: AppLayout.sidebarWidth,
          child: builtChild
        );
  }
}