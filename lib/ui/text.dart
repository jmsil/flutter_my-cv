import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hover.dart';
import 'layout/icons.dart';
import 'layout/layout_model.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;
  final bool enableOverflow;
  final Widget? trailingWidget;

  AppIconText({
    required this.icon,
    required this.text,
    required this.textStyle,
    this.enableOverflow = false,
    this.trailingWidget
  });

  AppIconText.bullet({
    required this.text,
    required this.textStyle
  }) :
    this.icon = AppIcons.bullet,
    this.enableOverflow = false,
    this.trailingWidget = null;

  @override
  Widget build(BuildContext context) {
    Align();
    return Row(
      spacing: AppLayout.smallSpacing,
      mainAxisSize: MainAxisSize.min,
      children: [

        icon == AppIcons.bullet
          ? SizedBox.square(dimension: 24, child: Icon(icon, size: 9.5, color: textStyle.color))
          : Icon(icon, color: textStyle.color),

        Flexible(
          child: Text(
            text,
            style: textStyle,
            overflow: enableOverflow ? TextOverflow.ellipsis : null
          )
        ),

        if (trailingWidget != null)
          trailingWidget!
      ]
    );
  }
}

class AppLink extends StatelessWidget {
  static const double _trailingIconSize = 18;

  final IconData icon;
  final String text;
  final String? link;
  final bool isOverBackground;
  final bool alwaysShowTrailingIcon;

  AppLink({
    this.icon = AppIcons.link,
    required this.text,
    this.link,
    this.isOverBackground = true,
    this.alwaysShowTrailingIcon = false
  });

  @override
  Widget build(BuildContext context) {
    return AppHoverWidget(
      builder: (BuildContext context, bool hovered, Widget? child) {
        final AppTheme theme = context.appLayout.theme;
        final TextStyle textStyle = isOverBackground
          ? hovered
            ? theme.background.normalText.decoration.bold
            : theme.background.normalText.over1.regular
          : hovered
            ? theme.sidebarSection.normalText.decoration.bold
            : theme.sidebarSection.normalText.over1.regular;

        return AppIconText(
          icon: icon,
          text: text,
          textStyle: textStyle,
          trailingWidget: SizedBox(
            width: _trailingIconSize, height: 24,
            child: hovered || alwaysShowTrailingIcon
              ? Icon(
                  AppIcons.openInNew,
                  size: _trailingIconSize,
                  color: hovered ? textStyle.color : textStyle.color?.withDarkDecorationAlpha
                )
              : null
          )
        );
      },
      onPressed: _launch
    );
  }

  void _launch() async {
    Uri uri = Uri.parse(link ?? text);
    if (await canLaunchUrl(uri))
      launchUrl(uri);
  }
}