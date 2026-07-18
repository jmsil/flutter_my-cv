import 'package:flutter/material.dart';

import '../content/profile_photo.dart';
import '../ui/assets.dart';
import '../ui/button/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/layout/edge_insets.dart';
import '../ui/layout/layout.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/state_provider.dart';
import 'main_scaffold.dart';

class AppSidebar extends StatelessWidget {
  static const double containerWidth = 480;

  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;

    final List<Widget> children = [

      if ( ! isDesktopScreen)
        AppLayout.normalVerticalSpacer,

      _DetailsSection(),
      AppLayout.normalVerticalSpacer,
      _SkillsSection(
        StringsProvider.strings.programmingSkillsTitle,
        Strings.programmingSkillsInfo
      ),
      AppLayout.normalVerticalSpacer,
      _SkillsSection(
        StringsProvider.strings.integrationSkillsTitle,
        Strings.integrationSkillsInfo
      ),
      AppLayout.normalVerticalSpacer,
      _AboutSection()
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
          _Settings()
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
                  ? _DesktopList(children)
                  : _MobileList(children)
              ),
              footerWidget
            ]
          )
        ]
      )
    );
  }
}

class _MobileList extends Padding {
  _MobileList(List<Widget> children)
    : super(
        padding: const AppEdgeInsets.normal(),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: AppTheme.lowDarkColor,
          child: LayoutBuilder(
            builder: (BuildContext builderContext, BoxConstraints builderConstraints) {
              return AppSliverScroller(
                [
                  SliverAppBar(
                    pinned: true,
                    stretch: true,
                    collapsedHeight: 76,
                    expandedHeight: builderConstraints.maxWidth,
                    backgroundColor: AppTheme.highDarkColor,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: AppTheme.highDarkColor,
                    shape: const RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
                    automaticallyImplyLeading: false,
                    flexibleSpace: _ProfileSection()
                  ),

                  SliverList(
                    delegate: SliverChildListDelegate(children)
                  )
                ]
              );
            }
          )
        )
      );
}

class _DesktopList extends AppbarAnimatedPadding {
  _DesktopList(List<Widget> children)
    : super(
        padding: AppEdgeInsets.normal(top: AppbarStateProvider.totalCollapsedHeight),
        child: OverlayBar(
          radius: AppTheme.radiusValue,
          startForegroundColor: AppTheme.lowDarkColor,
          child: AppListView(
            children: children
          )
        )
      );
}

class _ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppEdgeInsets.largeValue / 2),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ProfilePhoto(margin: AppEdgeInsets.smallValue)
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppButton.icon(
              icon: AppIcons.back,
              onPressed: () => Navigator.pop(context)
            )
          )
        ]
      )
    );
  }
}

class _DetailsSection extends _Section {
  _DetailsSection()
    : super(
        true,
        StringsProvider.strings.detailsTitle,
        Column(
          spacing: AppLayout.normalSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(
              icon: AppIcons.local,
              text: StringsProvider.strings.personalLocation,
              textStyle: AppTheme.highLightBlueStyle
            ),
            AppLink(
              icon: AppIcons.phone,
              text: Strings.personalPhone,
              link: Strings.personalPhoneLink,
              isDarkStyle: false
            ),
            AppLink(
              icon: AppIcons.mail,
              text: Strings.personalEmail,
              link: Strings.personalEmailLink,
              isDarkStyle: false
            ),
            AppLink(
              icon: AppIcons.code,
              text: Strings.personalGitHubLink,
              isDarkStyle: false
            )
          ]
        )
      );
}

class _SkillsSection extends StatelessWidget {
  final String title;
  final String info;

  _SkillsSection(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final List<String> items = info.split(' - ');

    for (String listItem in items) {
      Widget item = AppIconText(
        icon: AppIcons.topicMark,
        text: listItem,
        textStyle: AppTheme.highLightBlueStyle
      );
      children.add(item);
    }

    return _Section(
      false,
      title,
      Column(
        spacing: AppLayout.smallSpacing,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}

class _AboutSection extends _Section {
  _AboutSection()
    : super(
        false,
        StringsProvider.strings.aboutAndExpectationsTitle,
        Text(StringsProvider.strings.aboutAndExpectationsInfo, style: AppTheme.highLightBlueStyle)
      );
}

class _Section extends AppContainer {
  _Section(bool startOpen, String title, Widget contentWidget)
    : super(
        color: Colors.black26,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: const AppEdgeInsets.normal(left: AppEdgeInsets.largeValue),
          expandableContentPadding: const AppEdgeInsets.large(top: AppEdgeInsets.smallValue),
          headerContent: Text(title, style: AppTheme.largeLightBlueBoldStyle),
          expandableContent: contentWidget
        )
      );
}

class _Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;
    final TextStyle selectedStyle = isDesktopScreen
      ? LayoutProvider.theme.normalOverBackgroundColor2BoldStyle
      : LayoutProvider.theme.normalOverElement1Color1BoldStyle;
    final TextStyle unselectedStyle = isDesktopScreen
      ? LayoutProvider.theme.normalOverBackgroundColor2Style
      : LayoutProvider.theme.normalOverElement1Color1Style;

    final Widget languagesWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        AppButton.label(
          label: Strings.languagePt,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsProvider.languageCode == 'pt',
          onPressed: () => setLanguage('pt', context)
        ),
        AppButton.label(
          label: Strings.languageEn,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsProvider.languageCode != 'pt',
          onPressed: () => setLanguage('en', context)
        )
      ]
    );

    if ( ! isDesktopScreen)
      return languagesWidget;

    Widget layoutsWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        AppButton.icon(
          icon: AppIcons.flatLayout,
          color: LayoutProvider.theme.overBackgroundColor2,
          isSelected: LayoutProvider.layout == Layout.flat,
          onPressed: () => setLayout(Layout.flat, context)
        ),
        AppButton.icon(
          icon: AppIcons.leftLayout,
          color: LayoutProvider.theme.overBackgroundColor2,
          isSelected: LayoutProvider.layout == Layout.left,
          onPressed: () => setLayout(Layout.left, context)
        ),
        AppButton.icon(
          icon: AppIcons.fullLayout,
          color: LayoutProvider.theme.overBackgroundColor2,
          isSelected: LayoutProvider.layout == Layout.full,
          onPressed: () => setLayout(Layout.full, context)
        )
      ]
    );

    return AppPopupMenuButton(
      [
        _SettingsLabel(AppIcons.language, StringsProvider.strings.language),
        languagesWidget,
        AppLayout.shortVerticalSpacer,
        _SettingsLabel(AppIcons.layout, Strings.layout),
        layoutsWidget
      ]
    );
  }

  void setLanguage(String language, BuildContext context) {
    if (context.isDesktopScreen)
      Navigator.of(context).pop();
    StringsProvider.instance.setLanguage(language);
  }

  void setLayout(Layout layout, BuildContext context) {
    if (context.isDesktopScreen)
      Navigator.of(context).pop();
    LayoutProvider.instance.setLayout(layout);
  }
}

class _SettingsLabel extends Row {
  _SettingsLabel(IconData icon, String label)
    : super(
        spacing: AppLayout.smallSpacing,
        children: [
          Icon(icon, color: LayoutProvider.theme.overBackgroundColor1),
          Text(label, style: LayoutProvider.theme.normalOverBackgroundColor1BoldStyle)
        ]
      );
}