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
    final AppTheme theme = context.appLayout.theme;
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
      color: theme.elementColor1,
      padding: const AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue),
      child: Row(
        spacing: AppLayout.smallSpacing,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(
              StringsProvider.strings.madeWithFlutter,
              style: theme.text1OverElement1Color1Style
            )
          ),
          Settings()
        ]
      )
    );

    return AppContainer(
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
          Column(
            children: [
              Expanded(
                child: isDesktopScreen
                  ? DesktopList(theme, children)
                  : MobileList(theme, children)
              ),
              footerWidget
            ]
          )
        ]
      )
    );
  }
}