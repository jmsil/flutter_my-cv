import 'package:flutter/widgets.dart';

import '../ui/divider.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/icons.dart';
import '../ui/layout/layout_model.dart';
import '../ui/strings/strings_model.dart';

enum ProfileHeaderStyle {
  compactAppbar, extendedAppbar, extendedFlatAppbar, body;

  bool get isCompactAppbar => this == compactAppbar;
  bool get isExtendedAppbar => this == extendedAppbar;
  bool get isExtendedFlatAppbar => this == extendedFlatAppbar;
  bool get isBody => this == body;
}

class ProfileHeader extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String info;
  final ProfileHeaderStyle style;
  final bool softWrap;
  final bool enableIntrinsicWidth;

  ProfileHeader.nameAndRoles({
    required this.style,
    required bool isShortRoles,
    this.softWrap = true
  }) :
    this.icon = null,
    this.title = Strings.personalName,
    this.info = isShortRoles
      ? Strings.shortRoles
      : StringsModel.strings.longRoles,
    this.enableIntrinsicWidth = true;

  ProfileHeader.professionalSummary({
    required bool hasIcon,
    required this.style,
  }) :
    this.icon = hasIcon ? AppIcons.summary : null,
    this.title = StringsModel.strings.professionalSummaryTitle,
    this.info = StringsModel.strings.professionalSummaryInfo,
    this.softWrap = true,
    this.enableIntrinsicWidth = false;

  @override
  Widget build(BuildContext context) {
    final Brightness themeMode = LayoutModel.themeMode;
    final AppTheme theme = LayoutModel.theme;
    final double beforeDividerSpacing;
    final double afterDividerSpacing;
    final TextStyle titleStyle;
    final TextStyle infoStyle;

    final AppThemeData themeData =
      themeMode.isLightMode && (style.isExtendedFlatAppbar || style.isBody)
        ? theme.background
        : theme.appbar;

    switch (style) {
      case ProfileHeaderStyle.compactAppbar:
        beforeDividerSpacing = AppDimens.xSmall;
        afterDividerSpacing = AppDimens.xSmall;
        titleStyle = themeData.overStyled1.normalHeader.bold;
        infoStyle = themeData.overStyled1.normalText.regular;
        break;
      case ProfileHeaderStyle.extendedAppbar:
        beforeDividerSpacing = AppDimens.small;
        afterDividerSpacing = 0;
        titleStyle = themeData.overStyled1.largeHeader.bold;
        infoStyle = themeData.overStyled1.largeText.regular;
        break;
      case ProfileHeaderStyle.extendedFlatAppbar:
        beforeDividerSpacing = AppDimens.small;
        afterDividerSpacing = 0;
        titleStyle = themeData.overStyled1.xLargeHeader.bold;
        infoStyle = themeData.overStyled1.largeText.regular;
        break;
      case ProfileHeaderStyle.body:
        beforeDividerSpacing = AppDimens.normal;
        afterDividerSpacing = AppDimens.normal;
        titleStyle = themeData.overStyled1.xLargeHeader.bold;
        infoStyle = themeData.overStyled1.xLargeText.regular;
    }

    Widget builtTitleWidget = Text(title, style: titleStyle, softWrap: softWrap);

    if ( ! style.isCompactAppbar && icon != null) {
      builtTitleWidget = Row(
        spacing: titleStyle.fontSize!,
        children: [
          Icon(icon, size: titleStyle.fontSize! * 2, color: titleStyle.color),
          builtTitleWidget
        ]
      );
    }

    Widget builtInfoWidget = Text(info, style: infoStyle, softWrap: softWrap);

    if (style.isExtendedAppbar || style.isExtendedFlatAppbar) {
      builtInfoWidget = Expanded(
        child: Align(
          alignment: Alignment.bottomLeft,
          child: builtInfoWidget
        )
      );
    }

    Widget builtWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        builtTitleWidget,
        SizedBox(height: beforeDividerSpacing),
        AppDivider(4, titleStyle.color!),

        if (afterDividerSpacing > 0)
          SizedBox(height: afterDividerSpacing),

        builtInfoWidget
      ]
    );

    if (enableIntrinsicWidth)
      builtWidget = IntrinsicWidth(child: builtWidget);

    return builtWidget;
  }
}