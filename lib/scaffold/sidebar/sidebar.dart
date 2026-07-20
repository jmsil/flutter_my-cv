import 'package:flutter/material.dart';

import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../main_scaffold.dart';
import 'about_section.dart';
import 'desktop_list.dart';
import 'details_section.dart';
import 'mobile_list.dart';
import 'settings.dart';
import 'skills_section.dart';

class AppSidebar extends StatelessWidget {
  static const double containerWidth = 480;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isDesktopScreen = context.isDesktopScreen;

    final List<Widget> children = [
      if ( ! isDesktopScreen)
        AppLayout.normalVerticalSpacer,

      DetailsSection(theme),
      AppLayout.normalVerticalSpacer,

      SkillsSection(
        StringsProvider.strings.programmingSkillsTitle,
        Strings.programmingSkillsInfo
      ),
      AppLayout.normalVerticalSpacer,

      SkillsSection(
        StringsProvider.strings.integrationSkillsTitle,
        Strings.integrationSkillsInfo
      ),
      AppLayout.normalVerticalSpacer,

      AboutSection(theme)
    ];

    final Widget footerWidget = AppContainer(
      color: layout.hasSidebar ? theme.elementColor1 : null,
      padding: const AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue),
      child: Row(
        spacing: AppLayout.smallSpacing,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(
              StringsProvider.strings.madeWithFlutter,
              style: layout.hasSidebar
                ? theme.text1OverElement1Color1Style
                : theme.text1OverBackgroundColor1Style
            )
          ),
          Settings()
        ]
      )
    );

    final Widget child = Column(
      children: [
        Expanded(
          child: isDesktopScreen
            ? DesktopList(layout, children)
            : MobileList(theme, children)
        ),
        footerWidget
      ]
    );

    return layout.hasSidebar
      ? AppContainer(
          width: containerWidth,
          color: theme.elementColor2,
          borderRadius: isDesktopScreen
            ? AppTheme.allBorderRadius
            : BorderRadius.zero,
          isClipped: isDesktopScreen,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Image.memory(AppAssets.background, fit: BoxFit.fill),
              child
            ]
          )
        )
      : SizedBox(width: containerWidth, child: child);
  }
}