import 'package:flutter/material.dart';

import '../../content/pdf/generator.dart';
import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_theme_model.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/text.dart';
import '../device.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutThemeModel.theme.background;
    final bool isExtendedScreen = context.isExtendedScreen;

    return AppPopupMenuButton(
      themeData: themeData,
      spacing: AppDimens.normal,
      children: [
        _LanguagesSettings(),
        _ThemeSettings(),

        if (isExtendedScreen)
          _LayoutSettings(),

        AppSpacing.xxSmallV,
        AppMaterialButton(
          icon: AppIcons.download,
          text: Strings.downloadPdf,
          themeProperty: themeData.accentStyled1,
          onPressed: () => downloadPdf(context)
        )
      ]
    );
  }

  void downloadPdf(BuildContext context) {
    Navigator.of(context).pop();
    PdfGenerator.generateAndDownload(StringsModel.languageCode);
  }
}

class _LanguagesSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeDataStyledProperty themeProperty =
      LayoutThemeModel.theme.background.accentStyled1;
    return _Settings(
      AppIcons.language,
      StringsModel.strings.language,
      [
        AppButton.label(
          label: Strings.languagePt,
          themeProperty: themeProperty,
          isSelected: StringsModel.languageCode == 'pt',
          onPressed: () => setLanguage(context, 'pt')
        ),
        AppButton.label(
          label: Strings.languageEn,
          themeProperty: themeProperty,
          isSelected: StringsModel.languageCode != 'pt',
          onPressed: () => setLanguage(context, 'en')
        )
      ]
    );
  }

  void setLanguage(BuildContext context, String language) {
    Navigator.of(context).pop();
    StringsModel.instance.setLanguage(language);
  }
}

class _ThemeSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness themeMode = LayoutThemeModel.themeMode;
    final AppThemeDataBasicProperty themeProperty =
      LayoutThemeModel.theme.background.accent1;

    return _Settings(
      AppIcons.theme,
      StringsModel.strings.theme,
      [
        AppButton.icon(
          icon: AppIcons.themeLightMode,
          themeProperty: themeProperty,
          isSelected: themeMode == Brightness.light,
          onPressed: () => setTheme(context, Brightness.light)
        ),
        AppButton.icon(
          icon: AppIcons.themeDarkMode,
          themeProperty: themeProperty,
          isSelected: themeMode == Brightness.dark,
          onPressed: () => setTheme(context, Brightness.dark)
        )
      ]
    );
  }

  void setTheme(BuildContext context, Brightness themeMode) {
    Navigator.of(context).pop();
    LayoutThemeModel.instance.setThemeMode(themeMode);
  }
}

class _LayoutSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayoutMode layoutMode = LayoutThemeModel.layoutMode;
    final AppThemeDataBasicProperty themeProperty = LayoutThemeModel.theme.background.accent1;

    return _Settings(
      AppIcons.layout,
      Strings.layout,
      [
        AppButton.icon(
          icon: AppIcons.flatLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isFlat,
          onPressed: () => setLayout(context, AppLayoutMode.flat)
        ),
        AppButton.icon(
          icon: AppIcons.leftLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isLeft,
          onPressed: () => setLayout(context, AppLayoutMode.left)
        ),
        AppButton.icon(
          icon: AppIcons.topLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isTop,
          onPressed: () => setLayout(context, AppLayoutMode.top)
        ),
        AppButton.icon(
          icon: AppIcons.fullLayout,
          themeProperty: themeProperty,
          isSelected: layoutMode.isFull,
          onPressed: () => setLayout(context, AppLayoutMode.full)
        )
      ]
    );
  }

  void setLayout(BuildContext context, AppLayoutMode layoutMode) {
    Navigator.of(context).pop();
    LayoutThemeModel.instance.setLayoutMode(layoutMode);
  }
}

class _Settings extends Column {
  _Settings(
    IconData icon,
    String title,
    List<Widget> children
  ) : super(
    spacing: AppDimens.small,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppIconText(
        icon: icon,
        text: title,
        textStyle: LayoutThemeModel.theme.background.overStyled1.normalText.bold
      ),
      Row(
        spacing: AppDimens.normal,
        children: children
      )
    ]
  );
}