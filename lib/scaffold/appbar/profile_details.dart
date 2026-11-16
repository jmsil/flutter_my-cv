import 'package:material_ui/material_ui.dart';

import '../../ui/container.dart';
import '../../ui/divider.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text/icon_text.dart';
import '../../ui/text/link.dart';
import '../sidebar/sidebar_section.dart';

enum ProfileDetailsStyle {
  expandable, appbarHorizontal, appbarVertical;
  bool get isExpandable => this == expandable;
}

class ProfileDetails extends StatelessWidget {
  final ProfileDetailsStyle style;

  ProfileDetails(this.style);

  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppThemeData themeData = style.isExpandable
      ? LayoutModel.theme.sidebar
      : layoutMode.isFlat ? LayoutModel.theme.sidebar : LayoutModel.theme.appbar;

    final Widget? builtDivider = switch(style) {
      ProfileDetailsStyle.expandable => null,
      ProfileDetailsStyle.appbarHorizontal => SizedBox(
        height: 32,
        child: AppVerticalDivider(2, themeData.over1.color)
      ),
      ProfileDetailsStyle.appbarVertical => AppDivider(2, themeData.over1.color)
    };

    final List<Widget> children = [
      AppIconText(
        icon: AppIcons.local,
        text: StringsModel.strings.personalLocation,
        textStyle: themeData.overStyled1.normalText.regular
      ),

      if (builtDivider != null)
        builtDivider,

      AppLink(
        icon: AppIcons.phone,
        text: Strings.personalPhone,
        link: Strings.personalPhoneLink,
        themeData: themeData
      ),

      if (builtDivider != null)
        builtDivider,

      AppLink(
        icon: AppIcons.mail,
        text: Strings.personalEmail,
        link: Strings.personalEmailLink,
        themeData: themeData
      ),

      if (builtDivider != null)
        builtDivider,

      AppLink(
        icon: AppIcons.code,
        text: Strings.personalGitHubLink,
        themeData: themeData
      )
    ];

    switch(style) {
      case ProfileDetailsStyle.expandable:
        return SidebarSection(
          startOpen: true,
          title: StringsModel.strings.detailsTitle,
          child: Column(
            spacing: AppDimens.normal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          )
        );
      case ProfileDetailsStyle.appbarHorizontal:
        return AppContainer(
          height: 56,
          color: themeData.surfaceColor2,
          margin: const AppEdgeInsets.small(),
          borderRadius: layoutMode.isFlat
            ? AppTheme.allBorderRadius
            : const BorderRadius.all(Radius.circular(12)),
          child: Row(
            spacing: AppDimens.xxxLarge,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children
          )
        );
      case ProfileDetailsStyle.appbarVertical:
        return AppContainer(
          color: themeData.surfaceColor1,
          padding: const AppEdgeInsets.large(),
          borderRadius: AppTheme.bottomBorderRadius,
          child: Column(
            spacing: AppDimens.small,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          )
        );
    }
  }
}