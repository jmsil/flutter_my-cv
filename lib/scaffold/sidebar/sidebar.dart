import 'package:flutter/material.dart';

import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme.dart';
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
    final bool isDesktopScreen = context.isDesktopScreen;

    final List<Widget> children = [

      if ( ! isDesktopScreen)
        AppLayout.normalVerticalSpacer,

      DetailsSection(),
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
      AboutSection()
    ];

    final Widget footerWidget = AppContainer(
      color: AppTheme.highDarkColor,
      padding: const AppEdgeInsets.normal(vertical: AppEdgeInsets.smallValue),
      child: Row(
        spacing: AppLayout.smallSpacing,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(StringsProvider.strings.madeWithFlutter, style: AppTheme.lightBlueStyle)
          ),
          Settings()
        ]
      )
    );

    return AppContainer(
      width: containerWidth,
      color: AppTheme.lowDarkColor,
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
                  ? DesktopList(children)
                  : MobileList(children)
              ),
              footerWidget
            ]
          )
        ]
      )
    );
  }
}