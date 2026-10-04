import 'package:flutter/material.dart';

import '../../content/pdf/generator.dart';
import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings_provider.dart';
import '../device.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final bool isExtendedScreen = context.isExtendedScreen;

    final TextStyle selectedStyle = isExtendedScreen
      ? theme.text1OverBackgroundColor2BoldStyle
      : theme.text1OverElement1Color1BoldStyle;

    final TextStyle unselectedStyle = isExtendedScreen
      ? theme.text1OverBackgroundColor2Style
      : theme.text1OverElement1Color1Style;

    final Widget languagesWidget = Row(
      spacing: AppLayout.smallSpacing,
      children: [
        AppButton.label(
          label: Strings.languagePt,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsProvider.languageCode == 'pt',
          onPressed: () => setLanguage(context, 'pt', isExtendedScreen)
        ),
        AppButton.label(
          label: Strings.languageEn,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsProvider.languageCode != 'pt',
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
          color: theme.overBackgroundColor2,
          isSelected: layout == AppLayout.flat,
          onPressed: () => setLayout(context, AppLayout.flat)
        ),
        AppButton.icon(
          icon: AppIcons.leftLayout,
          color: theme.overBackgroundColor2,
          isSelected: layout == AppLayout.left,
          onPressed: () => setLayout(context, AppLayout.left)
        ),
        AppButton.icon(
          icon: AppIcons.topLayout,
          color: theme.overBackgroundColor2,
          isSelected: layout == AppLayout.top,
          onPressed: () => setLayout(context, AppLayout.top)
        ),
        AppButton.icon(
          icon: AppIcons.fullLayout,
          color: theme.overBackgroundColor2,
          isSelected: layout == AppLayout.full,
          onPressed: () => setLayout(context, AppLayout.full)
        )
      ]
    );

    final Widget downloadPdfButton = AppMaterialButton(
      theme,
      AppIcons.download,
      Strings.downloadPdf,
      onPressed: () => downloadPdf(context, StringsProvider.languageCode)
    );

    return AppPopupMenuButton(
      theme: theme,
      children: [
        _IconTitle(AppIcons.language, StringsProvider.strings.language, theme),
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
    StringsProvider.instance.setLanguage(language);
  }

  void setLayout(BuildContext context, AppLayout layout) {
    Navigator.of(context).pop();
    LayoutProvider.instance.setLayout(layout);
  }

  void downloadPdf(BuildContext context, String language) {
    Navigator.of(context).pop();
    PdfGenerator.generateAndDownload(language);
  }
}

class _IconTitle extends Row {
  _IconTitle(IconData icon, String label, AppTheme theme)
    : super(
        spacing: AppLayout.smallSpacing,
        children: [
          Icon(icon, color: theme.overBackgroundColor1),
          Text(label, style: theme.text1OverBackgroundColor1BoldStyle)
        ]
      );
}