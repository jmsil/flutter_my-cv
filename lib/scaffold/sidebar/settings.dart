import 'package:flutter/material.dart';

import '../../ui/button/button.dart';
import '../../ui/button/popup_menu_button.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme/icons.dart';
import '../../ui/theme/theme.dart';
import '../main_scaffold.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.providerTheme;
    final Layout layout = context.providerLayout;
    final bool isDesktopScreen = context.isDesktopScreen;

    final TextStyle selectedStyle = isDesktopScreen
      ? theme.text1OverBackgroundColor2BoldStyle
      : theme.text1OverElement1Color1BoldStyle;

    final TextStyle unselectedStyle = isDesktopScreen
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
          onPressed: () => setLanguage(context, 'pt', isDesktopScreen)
        ),
        AppButton.label(
          label: Strings.languageEn,
          selectedStyle: selectedStyle,
          unselectedStyle: unselectedStyle,
          isSelected: StringsProvider.languageCode != 'pt',
          onPressed: () => setLanguage(context, 'en', isDesktopScreen)
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
          color: theme.overBackgroundColor2,
          isSelected: layout == Layout.flat,
          onPressed: () => setLayout(context, Layout.flat, isDesktopScreen)
        ),
        AppButton.icon(
          icon: AppIcons.leftLayout,
          color: theme.overBackgroundColor2,
          isSelected: layout == Layout.left,
          onPressed: () => setLayout(context, Layout.left, isDesktopScreen)
        ),
        AppButton.icon(
          icon: AppIcons.fullLayout,
          color: theme.overBackgroundColor2,
          isSelected: layout == Layout.full,
          onPressed: () => setLayout(context, Layout.full, isDesktopScreen)
        )
      ]
    );

    return AppPopupMenuButton(
      theme: theme,
      children: [
        _IconTitle(AppIcons.language, StringsProvider.strings.language, theme),
        languagesWidget,
        AppLayout.shortVerticalSpacer,
        _IconTitle(AppIcons.layout, Strings.layout, theme),
        layoutsWidget
      ]
    );
  }

  void setLanguage(BuildContext context, String language, bool isDesktopScreen) {
    if (isDesktopScreen)
      Navigator.of(context).pop();
    StringsProvider.instance.setLanguage(language);
  }

  void setLayout(BuildContext context, Layout layout, bool isDesktopScreen) {
    if (isDesktopScreen)
      Navigator.of(context).pop();
    LayoutProvider.instance.setLayout(layout);
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