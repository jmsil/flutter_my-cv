import 'package:flutter/material.dart';

import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/container/header_expandable.dart';
import '../ui/divider.dart';
import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/text.dart';
import '../ui/theme.dart';

class AppSidebar extends StatelessWidget {
  static const Color _sectionColor = Colors.black26;
  static const EdgeInsets sectionHeaderPadding = EdgeInsets.fromLTRB(24, 16, 16, 16);
  static const EdgeInsets sectionContentPadding = EdgeInsets.fromLTRB(24, 8, 24, 24);

  final bool addBackButton;
  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.addBackButton, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final Widget sliverProfile = SliverAppBar(
      expandedHeight: 360,
      collapsedHeight: 196,
      stretch: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _ProfileSection(addBackButton)
    );

    final Widget sliverInfo = SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            _DetailsSection(),
            AppUiConst.vsep16,
            _SkillsSection(),
            AppUiConst.vsep16,
            _AboutSection()
          ]
        )
      )
    );

    final Widget footerWidget = AppContainer(
      color: AppTheme.darkColor.withValues(alpha: 0.48),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        spacing: 8,
        children: [
          FlutterLogo(size: 32),
          Expanded(
            child: Text(AppStrings.powredByFlutter, style: AppTheme.lightStyle)
          ),
          AppButton.label(AppStrings.langIdx == 0, 'Pt', onPressedPt),
          AppButton.label(AppStrings.langIdx == 1, 'En', onPressedEn)
        ]
      )
    );

    return AppContainer(
      width: 420,
      color: AppTheme.midDarkColor,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter
            ),
            Column(
              spacing: 16,
              children: [
                Expanded(
                  child: AppSliverScroller(
                    [
                      sliverProfile,
                      sliverInfo
                    ]
                  )
                ),
                footerWidget
              ]
            )
          ]
        )
      )
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final bool addBackButton;

  _ProfileSection(this.addBackButton);

  @override
  Widget build(BuildContext context) {
    final double padding = addBackButton ? 12 : 36;

    Widget child = Column(
      spacing: 8,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: AppContainer(
              borderSize: 2,
              borderColor: AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(1000),
              isClipped: true,
              child: Image.asset('assets/profile_photo.jpeg', fit: BoxFit.cover)
            )
          )
        ),
        AppUiConst.vsep8,
        Text('João Marques da Silva', style: AppTheme.lightBlueStyle),
        SizedBox(width: 96, child: AppDivider(4)),
        Text(AppStrings.role, style: AppTheme.lightBlueStyle)
      ]
    );

    if (addBackButton) {
      child = Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: child
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AppButton.icon(
              AppIcons.back,
              () => Navigator.pop(context)
            )
          )
        ]
      );
    }

    return AppContainer(
      color: AppSidebar._sectionColor,
      borderRadius: AppTheme.sectionRadius,
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(padding),
      child: child
    );
  }
}

class _DetailsSection extends _Section {
  _DetailsSection()
    : super(
        true,
        Text(AppStrings.details, style: AppTheme.lightBlueStyle),
        Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(AppIcons.local, AppStrings.brazil, true),
            AppIconText(AppIcons.phone, '+55 62 99497-1154', true),
            AppIconText(AppIcons.mail, 'jmsilva.inbox@gmail.com', true),
            AppIconText(AppIcons.code, 'https://github.com/Jmsil', true, true)
          ]
        )
      );
}

class _SkillsSection extends _Section {
  _SkillsSection()
    : super(
        true,
        Text(AppStrings.skills, style: AppTheme.lightBlueStyle),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIconText(AppIcons.arrow_right, 'Dart/Flutter', true),
            AppIconText(AppIcons.arrow_right, 'Android SDK', true),
            AppIconText(AppIcons.arrow_right, 'Java', true),
            AppIconText(AppIcons.arrow_right, 'C/C++', true),
            AppIconText(AppIcons.arrow_right, 'Oracle Database', true),
            AppIconText(AppIcons.arrow_right, 'MySQL Database', true),
            AppIconText(AppIcons.arrow_right, 'SQL/PL SQL', true),
            AppIconText(AppIcons.arrow_right, 'Git', true)
          ]
        )
      );
}

class _AboutSection extends _Section {
  _AboutSection()
    : super(
        false,
        Text(AppStrings.aboutAndExpectationsTitle, style: AppTheme.lightBlueStyle),
        Text(AppStrings.aboutAndExpectationsText, style: AppTheme.lightStyle)
      );
}

class _Section extends AppContainer {
  _Section(bool startOpen, Widget headerWidget, Widget contentWidget)
    : super(
        color: AppSidebar._sectionColor,
        borderRadius: AppTheme.sectionRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: startOpen,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: AppSidebar.sectionHeaderPadding,
          expandableContentPadding: AppSidebar.sectionContentPadding,
          headerContent: headerWidget,
          expandableContent: contentWidget
        )
      );
}