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
  static Color _sectionColor = Colors.black26;

  final Function() onPressedPt;
  final Function() onPressedEn;

  AppSidebar(this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    final Widget sliverProfile = SliverAppBar(
      stretch: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      expandedHeight: 360,
      collapsedHeight: 196,
      leading: Navigator.canPop(context)
        ? AppButton.icon(
            AppIcons.back,
            () => Navigator.pop(context)
          )
        : null,
      flexibleSpace: _ProfileSection()
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
        children: [
          FlutterLogo(size: 32),
          AppUiConst.hsep8,
          Expanded(
            child: Text(AppStrings.powredByFlutter, style: AppTheme.lightStyle)
          ),
          AppUiConst.hsep8,
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
              children: [
                Expanded(
                  child: AppSliverScroller(
                    [
                      sliverProfile,
                      sliverInfo
                    ]
                  )
                ),
                AppUiConst.vsep16,
                footerWidget
              ]
            )
          ]
        )
      )
    );
  }
}

class _ProfileSection extends AppContainer {
  _ProfileSection()
    : super(
        color: AppSidebar._sectionColor,
        borderRadius: AppTheme.sectionRadius,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(36),
        child: Column(
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
            AppUiConst.vsep16,
            Text('João Marques da Silva', style: AppTheme.lightBlueStyle),
            AppUiConst.vsep8,
            SizedBox(width: 96, child: AppDivider(4)),
            AppUiConst.vsep8,
            Text(AppStrings.role, style: AppTheme.lightBlueStyle)
          ]
        )
      );
}

class _DetailsSection extends AppContainer {
  _DetailsSection()
    : super(
        color: AppSidebar._sectionColor,
        borderRadius: AppTheme.sectionRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: true,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: const EdgeInsets.all(24),
          expandableContentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          headerContent: Text(AppStrings.details, style: AppTheme.lightBlueStyle),
          expandableContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconText(AppIcons.local, AppStrings.brazil, true),
              AppUiConst.vsep12,
              AppIconText(AppIcons.phone, '+55 62 99497-1154', true),
              AppUiConst.vsep12,
              AppIconText(AppIcons.mail, 'jmsilva.inbox@gmail.com', true),
              AppUiConst.vsep12,
              AppIconText(AppIcons.code, 'https://github.com/Jmsil', true, true)
            ]
          )
        )
      );
}

class _SkillsSection extends AppContainer {
  _SkillsSection()
    : super(
        color: AppSidebar._sectionColor,
        borderRadius: AppTheme.sectionRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          startOpen: true,
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: const EdgeInsets.all(24),
          expandableContentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          headerContent: Text(AppStrings.skills, style: AppTheme.lightBlueStyle),
          expandableContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIconText(AppIcons.arrow_right, 'Dart/Flutter', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'Android SDK', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'Java', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'C/C++', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'Oracle Database', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'MySQL Database', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'SQL/PL SQL', true),
              AppUiConst.vsep8,
              AppIconText(AppIcons.arrow_right, 'Git', true)
            ]
          )
        )
      );
}

class _AboutSection extends AppContainer {
  _AboutSection()
    : super(
        color: AppSidebar._sectionColor,
        borderRadius: AppTheme.sectionRadius,
        isClipped: true,
        child: AppHeaderExpandable(
          arrowColor: AppTheme.lightBlue,
          headerContentPadding: const EdgeInsets.all(24),
          expandableContentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          headerContent: Text(
            AppStrings.aboutAndExpectationsTitle, style: AppTheme.lightBlueStyle
          ),
          expandableContent: Text(
            AppStrings.aboutAndExpectationsText, style: AppTheme.lightStyle
          )
        )
      );
}