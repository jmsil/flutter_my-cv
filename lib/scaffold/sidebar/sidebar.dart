import 'package:flutter/material.dart';

import '../../ui/container.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../device.dart';
import 'section_about.dart';
import 'section_details.dart';
import 'settings.dart';
import 'sidebar_compact.dart';
import 'sidebar_extended.dart';
import 'skills_section.dart';

class AppSidebar extends StatelessWidget {
  static const double width = 480;

  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppTheme theme = LayoutModel.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final List<Widget> children = [
      if ( ! isExtendedScreen)
        AppSpacing.normalV,

      SectionDetails(),
      AppSpacing.normalV,

      SkillsSection.programming(),
      AppSpacing.normalV,

      SkillsSection.integration(),
      AppSpacing.normalV,

      SectionAbout()
    ];

    final Widget footerWidget = AppContainer(
      color: layoutMode.showSidebarBackground ? theme.appbar.surfaceColor1 : null,
      padding: const AppEdgeInsets.normal(vertical: AppDimens.small),
      child: Row(
        spacing: AppDimens.small,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(
              StringsModel.strings.madeWithFlutter,
              style: layoutMode.showSidebarBackground
                ? theme.appbar.overStyled1.normalText.regular
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
            ? AppSidebarExtended(children)
            : AppSidebarCompact(children)
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