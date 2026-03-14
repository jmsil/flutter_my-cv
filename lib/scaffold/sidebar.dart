import 'package:flutter/material.dart';
import 'package:my_cv/content/profile_photo.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/container/overlay_bar.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/state_provider.dart';
import 'main_scaffold.dart';

class AppSidebar extends StatelessWidget {
  static const double containerWidth = 480;

  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;

    final List<Widget> children = [

      if (!isDesktopScreen)
        AppTheme.normalVerticalSpacing,

      _DetailsSection(),
      AppTheme.normalVerticalSpacing,
      _SkillsSection(
        AppStrings.programmingSkillsTitle, AppStrings.programmingSkillsInfo
      ),
      AppTheme.normalVerticalSpacing,
      _SkillsSection(
        AppStrings.integrationSkillsTitle, AppStrings.integrationSkillsInfo
      ),
      AppTheme.normalVerticalSpacing,
      _AboutSection()
    ];

    final Widget footerWidget = AppContainer(
      color: AppTheme.highDarkColor,
      padding: const EdgeInsets.symmetric(
        horizontal: ThemedEdgeInsets.normalValue,
        vertical: ThemedEdgeInsets.smallValue
      ),
      child: Row(
        spacing: AppTheme.smallSpacingValue,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(AppStrings.powredByFlutter, style: AppTheme.lightBlueStyle)
          ),
          AppButton.label(AppStrings.langCode == 'pt', 'Pt', onPressedPt),
          AppButton.label(AppStrings.langCode != 'pt', 'En', onPressedEn)
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
        padding: const ThemedEdgeInsets.normal(),
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
        padding: ThemedEdgeInsets.normal(top: AppbarStateProvider.totalCollapsedHeight),
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
      padding: const EdgeInsets.all(ThemedEdgeInsets.largeValue / 2),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: ProfilePhoto(margin: ThemedEdgeInsets.smallValue)
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppButton.icon(
              AppIcons.back,
              () => Navigator.pop(context)
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
        AppStrings.detailsTitle,
        Column(
          spacing: AppTheme.normalSpacingValue,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(
              icon: AppIcons.local,
              text: AppStrings.personalLocal,
              textStyle: AppTheme.highLightBlueStyle
            ),
            AppLink(
              icon: AppIcons.phone,
              text: AppStrings.personalPhone,
              link: AppStrings.personalPhoneLink,
              isDarkStyle: false
            ),
            AppLink(
              icon: AppIcons.mail,
              text: AppStrings.personalEmail,
              link: AppStrings.personalEmailLink,
              isDarkStyle: false
            ),
            AppLink(
              icon: AppIcons.code,
              text: AppStrings.personalGitHubLink,
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
        spacing: AppTheme.smallSpacingValue,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children
      )
    );
  }
}


class _AboutSection extends _Section {
  _AboutSection()
    : super(
        true,
        AppStrings.aboutAndExpectationsTitle,
        Text(AppStrings.aboutAndExpectationsInfo, style: AppTheme.highLightBlueStyle)
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
          headerContentPadding: const ThemedEdgeInsets.normal(left: ThemedEdgeInsets.largeValue),
          expandableContentPadding: const ThemedEdgeInsets.large(top: ThemedEdgeInsets.smallValue),
          headerContent: Text(title, style: AppTheme.largeLightBlueBoldStyle),
          expandableContent: contentWidget
        )
      );
}