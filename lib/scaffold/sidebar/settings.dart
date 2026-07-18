import 'package:flutter/material.dart';

import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme/icons.dart';
import '../main_scaffold.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;
    final TextStyle selectedStyle = isDesktopScreen
      ? LayoutProvider.theme.text1OverBackgroundColor2BoldStyle
      : LayoutProvider.theme.text1OverElement1Color1BoldStyle;
    final TextStyle unselectedStyle = isDesktopScreen
      ? LayoutProvider.theme.text1OverBackgroundColor2Style
      : LayoutProvider.theme.text1OverElement1Color1Style;

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
        _IconTitle(AppIcons.language, StringsProvider.strings.language),
        languagesWidget,
        AppLayout.shortVerticalSpacer,
        _IconTitle(AppIcons.layout, Strings.layout),
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

class _IconTitle extends Row {
  _IconTitle(IconData icon, String label)
    : super(
        spacing: AppLayout.smallSpacing,
        children: [
          Icon(icon, color: LayoutProvider.theme.overBackgroundColor1),
          Text(label, style: LayoutProvider.theme.text1OverBackgroundColor1BoldStyle)
        ]
      );
}