import 'package:flutter/material.dart';
import 'package:my_cv/content/profile_photo.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/state_provider.dart';

class AppSidebar extends StatelessWidget {
  static const double containerWidth = 480;

  final bool isMobileScaffold;
  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.isMobileScaffold, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
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
      margin: isMobileScaffold ? const ThemedEdgeInsets.normal() : null,
      borderRadius: AppTheme.allBorderRadius,
      isClipped: true,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Image.asset(AppAssets.background, fit: BoxFit.cover, alignment: Alignment.topCenter),
          Column(
            spacing: AppTheme.normalSpacingValue,
            children: [
              Expanded(
                child: isMobileScaffold
                  ? _MobileList(children)
                  : _DesktopList(children)
              ),
              footerWidget
            ]
          )
        ]
      )
    );
  }
}


class _MobileList extends AppSliverScroller {
  _MobileList(List<Widget> children)
    : super(
        [
          SliverAppBar(
            expandedHeight: AppSidebar.containerWidth,
            collapsedHeight: 108,
            stretch: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: _ProfileSection()
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: ThemedEdgeInsets.normalValue),
            sliver: SliverList(
              delegate: SliverChildListDelegate(children)
            )
          )
        ]
      );
}


class _DesktopList extends AppbarAnimatedPadding {
  _DesktopList(List<Widget> children)
    : super(
        padding: ThemedEdgeInsets.normal(
          top: AppbarStateProvider.totalCollapsedHeight,
          bottom: 0
        ),
        child: AppListView(
          children: children
        )
      );
}


class _ProfileSection extends StatelessWidget {
  static const EdgeInsets padding = EdgeInsets.all(ThemedEdgeInsets.largeValue / 2);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppTheme.darkColor.withValues(alpha: 0.48),
      borderRadius: AppTheme.allBorderRadius,
      margin: const ThemedEdgeInsets.normal(),
      padding: padding,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: padding,
            child: Center(
              child: ProfilePhoto(withMargin: false)
            )
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
            AppIconText(AppIcons.local, AppStrings.personalLocal, true),
            AppIconText(AppIcons.phone, AppStrings.personalPhone, true),
            AppIconText(AppIcons.mail, AppStrings.personalEmail, true),
            AppIconText(AppIcons.code, AppStrings.personalGitHub, true, true)
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
      Widget item = AppIconText(AppIcons.arrowRight, listItem, true);
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
  static const EdgeInsets sectionHeaderPadding = ThemedEdgeInsets.normal(
    left: ThemedEdgeInsets.largeValue
  );
  static const EdgeInsets sectionContentPadding = ThemedEdgeInsets.large(
    top: ThemedEdgeInsets.smallValue
  );

  _Section(bool startOpen, String title, Widget contentWidget)
    : super(
        color: Colors.black26,
        borderRadius: AppTheme.allBorderRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: sectionHeaderPadding,
          expandableContentPadding: sectionContentPadding,
          headerContent: Text(title, style: AppTheme.largeLightBlueBoldStyle),
          expandableContent: contentWidget
        )
      );
}