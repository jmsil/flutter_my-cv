import 'package:flutter/widgets.dart';

import '../../ui/container.dart';
import '../../ui/layout/device.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import 'section_about.dart';
import 'section_details.dart';
import 'section_skills.dart';
import 'settings.dart';
import 'sidebar_compact.dart';
import 'sidebar_extended.dart';

class AppSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppThemeData themeData = LayoutModel.theme.sidebar;
    final bool isExtendedScreen = context.isExtendedScreen;
    final bool skillsStartOpen = isExtendedScreen && ! layoutMode.isLeft;

    final List<Widget> children = [
      if ( ! isExtendedScreen) ...[
        AppSpacing.normalV,
        SectionDetails(SectionDetailsStyle.expandable),
        AppSpacing.normalV
      ],

      SectionSkills.programming(startOpen: skillsStartOpen),
      AppSpacing.normalV,
      SectionSkills.integration(startOpen: skillsStartOpen),
      AppSpacing.normalV,
      SectionAbout()
    ];

    final Widget builtWidget = Column(
      children: [
        Expanded(
          child: isExtendedScreen
            ? AppSidebarExtended(children)
            : AppSidebarCompact(children)
        ),
        _Footer()
      ]
    );

    return layoutMode.showSidebarBackground
      ? AppContainer.gradient(
          width: LayoutModel.sidebarWidth,
          color: themeData.surfaceColor1,
          borderRadius: isExtendedScreen ? AppTheme.allBorderRadius : null,
          gradientColor: themeData.accent1.color,
          gradientAxis: Axis.vertical,
          child: builtWidget
        )
      : SizedBox(
          width: LayoutModel.sidebarWidth,
          child: builtWidget
        );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppTheme theme = LayoutModel.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final Widget builtWidget = Row(
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
    );

    return layoutMode.showSidebarBackground
      ? AppContainer(
          color: theme.appbar.surfaceColor1,
          padding: const AppEdgeInsets.normal(vertical: AppDimens.small),
          borderRadius: isExtendedScreen ? AppTheme.bottomBorderRadius : null,
          child: builtWidget
        )
      : Padding(
          padding: const AppEdgeInsets.normal(vertical: AppDimens.small),
          child: builtWidget
        );
  }
}