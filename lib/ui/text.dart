import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hover.dart';
import 'layout/icons.dart';
import 'layout/layout_provider.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;
  final Widget? trailingWidget;

  AppIconText({
    required this.icon,
    required this.text,
    required this.textStyle,
    this.trailingWidget
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppLayout.smallSpacing,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: text.contains('\n')
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: textStyle.color),
        Text(text, style: textStyle),

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

  AppLink({
    this.icon = AppIcons.link,
    required this.text,
    this.link,
    this.isOverBackground = true
  });

  @override
  Widget build(BuildContext context) {
    return AppHoverWidget(
      builder: (BuildContext context, bool hovered, Widget? child) {
        final AppTheme theme = context.appLayout.theme;
        final TextStyle textStyle = isOverBackground
          ? hovered
            ? theme.text1OverBackgroundColor2Style
            : theme.text1OverBackgroundColor1Style
          : hovered
            ? theme.text1OverSectionColor3Style
            : theme.text1OverSectionColor1Style;

        return AppIconText(
          icon: icon,
          text: text,
          textStyle: textStyle,
          trailingWidget: hovered
            ? Icon(AppIcons.openInNew, size: _trailingIconSize, color: textStyle.color)
            : SizedBox(width: _trailingIconSize)
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