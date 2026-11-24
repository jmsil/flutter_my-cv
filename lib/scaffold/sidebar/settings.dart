import 'package:flutter/widgets.dart';

import '../../pdf/generator.dart';
import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/container.dart';
import '../../ui/layout/device.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text/icon_text.dart';
import '../../ui/viewer/cover_letter_settings.dart';
import '../../ui/viewer/viewer_cover_letter.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    final bool isExtendedScreen = context.isExtendedScreen;
    return AppPopupMenuButton(
      themeData: themeData,
      children: [
        _LanguagesSettings(),
        AppSpacing.smallV,
        _ThemeSettings(),
        AppSpacing.smallV,

        if (isExtendedScreen) ...[
          _LayoutSettings(),
          AppSpacing.smallV
        ],

        AppSpacing.smallV,
        _CoverLetterButton(),
        AppSpacing.smallV,
        _DownloadCvButton()
      ]
    );
  }
}

class _LanguagesSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeDataStyledProperty themeProperty = LayoutModel.theme.background.accentStyled1;
    return _Settings(
      AppIcons.language,
      StringsModel.strings.language,
      [
        AppIconButton.label(
          label: Strings.languagePt,
          themeProperty: themeProperty,
          isSelected: StringsModel.languageCode == 'pt',
          onPressed: () => onPressed(context, 'pt')
        ),
        AppIconButton.label(
          label: Strings.languageEn,
          themeProperty: themeProperty,
          isSelected: StringsModel.languageCode != 'pt',
          onPressed: () => onPressed(context, 'en')
        )
      ]
    );
  }

  void onPressed(BuildContext context, String language) {
    AppPopupMenuButton.performAction(
      context, () => StringsModel.instance.setLanguage(language)
    );
  }
}

class _ThemeSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness themeMode = LayoutModel.themeMode;
    final AppThemeDataBasicProperty themeProperty = LayoutModel.theme.background.accent1;
    return _Settings(
      AppIcons.theme,
      StringsModel.strings.theme,
      [
        AppIconButton(
          icon: AppIcons.themeLightMode,
          themeProperty: themeProperty,
          isSelected: themeMode == Brightness.light,
          onPressed: () => onPressed(context, Brightness.light)
        ),
        AppIconButton(
          icon: AppIcons.themeDarkMode,
          themeProperty: themeProperty,
          isSelected: themeMode == Brightness.dark,
          onPressed: () => onPressed(context, Brightness.dark)
        )
      ]
    );
  }

  void onPressed(BuildContext context, Brightness themeMode) {
    AppPopupMenuButton.performAction(
      context, () => LayoutModel.instance.setThemeMode(themeMode)
    );
  }
}

class _LayoutSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppThemeDataBasicProperty themeProperty = LayoutModel.theme.background.accent1;
    return _Settings(
      AppIcons.layout,
      Strings.layout,
      [
        AppIconButton(
          icon: AppIcons.flatLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isFlat,
          onPressed: () => onPressed(context, LayoutMode.flat)
        ),
        AppIconButton(
          icon: AppIcons.leftLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isLeft,
          onPressed: () => onPressed(context, LayoutMode.left)
        ),
        AppIconButton(
          icon: AppIcons.topLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isTop,
          onPressed: () => onPressed(context, LayoutMode.top)
        ),
        AppIconButton(
          icon: AppIcons.fullLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isFull,
          onPressed: () => onPressed(context, LayoutMode.full)
        )
      ]
    );
  }

  void onPressed(BuildContext context, LayoutMode layoutMode) {
    AppPopupMenuButton.performAction(
      context, () => LayoutModel.instance.setLayoutMode(layoutMode)
    );
  }
}

class _CoverLetterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    return AppButton(
      icon: AppIcons.mail,
      text: StringsModel.strings.coverLetter,
      themeProperty: themeData.accentStyled1,
      expands: true,
      onPressed: () => onPressed(context)
    );
  }

  void onPressed(BuildContext context) {

    AppPopupMenuButton.performAction(
      context,
      () async {
        final CoverLetterSettings? settings = await CoverLetterSettingsDialog.show();

        if (settings != null) {
          ViewerCoverLetter.show(
            companyName: settings.companyName,
            role: settings.role,
            info: settings.coverLetter
          );
        }
      }
    );
  }
}

class _DownloadCvButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    return AppButton(
      icon: AppIcons.download,
      text: StringsModel.strings.downloadCv,
      themeProperty: themeData.accentStyled1,
      expands: true,
      onPressed: () => onPressed(context)
    );
  }

  void onPressed(BuildContext context) {
    AppPopupMenuButton.performAction(
      context, PdfGenerator.downloadCv
    );
  }
}

class _Settings extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  _Settings(this.icon, this.title, this.children);

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.background;
    return AppContainer(
      color: themeData.surfaceColor2.withCardFillAlpha,
      padding: const AppEdgeInsets.normal(bottom: AppDimens.small),
      borderRadius: AppTheme.allBorderRadius,
      child: Column(
        spacing: AppDimens.small,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIconText(
            icon: icon,
            text: title,
            textStyle: themeData.overStyled1.normalText.bold
          ),
          Row(spacing: AppDimens.normal, children: children)
        ]
      )
    );
  }
}