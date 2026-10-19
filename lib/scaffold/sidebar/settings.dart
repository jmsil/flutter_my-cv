import 'package:flutter/material.dart';

import '../../content/pdf/generator.dart';
import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import '../device.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final TextStyle selectedStyle = isExtendedScreen
      ? theme.background.normalText.decoration.bold
      : theme.brand1.normalText.over1.bold;

    final TextStyle unselectedStyle = isExtendedScreen
      ? theme.background.normalText.decoration.regular
      : theme.brand1.normalText.over1.regular;

    final Widget languagesWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        AppButton.label(
          label: Strings.languagePt,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsModel.languageCode == 'pt',
          onPressed: () => setLanguage(context, 'pt', isExtendedScreen)
        ),
        AppButton.label(
          label: Strings.languageEn,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsModel.languageCode != 'pt',
          onPressed: () => setLanguage(context, 'en', isExtendedScreen)
        )
      ]
    );

    if ( ! isExtendedScreen)
      return languagesWidget;

    final Widget layoutsWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        AppButton.icon(
          icon: AppIcons.flatLayout,
          color: theme.background.decorationColor,
          isSelected: layout == AppLayout.flat,
          onPressed: () => setLayout(context, AppLayout.flat)
        ),
        AppButton.icon(
          icon: AppIcons.leftLayout,
          color: theme.background.decorationColor,
          isSelected: layout == AppLayout.left,
          onPressed: () => setLayout(context, AppLayout.left)
        ),
        AppButton.icon(
          icon: AppIcons.topLayout,
          color: theme.background.decorationColor,
          isSelected: layout == AppLayout.top,
          onPressed: () => setLayout(context, AppLayout.top)
        ),
        AppButton.icon(
          icon: AppIcons.fullLayout,
          color: theme.background.decorationColor,
          isSelected: layout == AppLayout.full,
          onPressed: () => setLayout(context, AppLayout.full)
        )
      ]
    );

    final Widget downloadPdfButton = AppMaterialButton(
      theme,
      AppIcons.download,
      Strings.downloadPdf,
      onPressed: () => downloadPdf(context, StringsModel.languageCode)
    );

    return AppPopupMenuButton(
      theme: theme,
      children: [
        _IconTitle(AppIcons.language, StringsModel.strings.language, theme),
        languagesWidget,
        AppLayout.tinyVerticalSpacer,
        _IconTitle(AppIcons.layout, Strings.layout, theme),
        layoutsWidget,
        AppLayout.normalVerticalSpacer,
        downloadPdfButton
      ]
    );
  }

  void setLanguage(BuildContext context, String language, bool isExtendedScreen) {
    if (isExtendedScreen)
      Navigator.of(context).pop();
    StringsModel.instance.setLanguage(language);
  }

  void setLayout(BuildContext context, AppLayout layout) {
    Navigator.of(context).pop();
    LayoutModel.instance.setLayout(layout);
  }

  void downloadPdf(BuildContext context, String language) {
    Navigator.of(context).pop();
    PdfGenerator.generateAndDownload(language);
  }
}

class _IconTitle extends Row {
  _IconTitle(
    IconData icon, String label, AppTheme theme
  ) : super(
    spacing: AppLayout.smallSpacing,
    children: [
      Icon(icon, color: theme.background.overColor1),
      Text(label, style: theme.background.normalText.over1.bold)
    ]
  );
}