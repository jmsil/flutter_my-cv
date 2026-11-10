import 'package:flutter/material.dart';

import '../../ui/container.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_theme_model.dart';
import '../../ui/strings/strings_model.dart';
import '../device.dart';
import 'about_section.dart';
import 'compact_list.dart';
import 'details_section.dart';
import 'extended_list.dart';
import 'settings.dart';
import 'skills_section.dart';

class AppSidebar extends StatelessWidget {
  static const double width = 480;

  @override
  Widget build(BuildContext context) {
    final AppLayoutMode layoutMode = LayoutThemeModel.layoutMode;
    final AppTheme theme = LayoutThemeModel.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final List<Widget> children = [
      if ( ! isExtendedScreen)
        AppSpacing.normalV,

      DetailsSection(),
      AppSpacing.normalV,

      SkillsSection.programming(),
      AppSpacing.normalV,

      SkillsSection.integration(),
      AppSpacing.normalV,

      AboutSection()
    ];

    final Widget footerWidget = AppContainer(
      color: layoutMode.showSidebarBackground ? theme.brand1.surfaceColor1 : null,
      padding: const AppEdgeInsets.normal(vertical: AppDimens.small),
      child: Row(
        spacing: AppDimens.small,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(
              StringsModel.strings.madeWithFlutter,
              style: layoutMode.showSidebarBackground
                ? theme.brand1.overStyled1.normalText.regular
                : theme.background.overStyled1.normalText.regular
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

    return layoutMode.showSidebarBackground
      ? AppContainer(
          width: width,
          color: theme.sidebar.surfaceColor1,
          borderRadius: isExtendedScreen
            ? AppTheme.allBorderRadius
            : BorderRadius.zero,
          enableClip: isExtendedScreen,
          child: builtChild
        )
      : AppContainer(
          width: width,
          child: builtChild
        );
  }
}