import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hover.dart';
import 'layout/layout.dart';
import 'layout/layout_provider.dart';
import 'theme/icons.dart';

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
      builder: _hoverBuilder,
      onPressed: _launch
    );
  }

  Widget _hoverBuilder(bool hovered, Widget? child) {
    final TextStyle textStyle = isOverBackground
      ? hovered
        ? LayoutProvider.theme.text1OverBackgroundColor2Style
        : LayoutProvider.theme.text1OverBackgroundColor1Style
      : hovered
        ? LayoutProvider.theme.text1OverSectionColor3Style
        : LayoutProvider.theme.text1OverSectionColor1Style;

    return AppIconText(
      icon: icon,
      text: text,
      textStyle: textStyle,
      trailingWidget: hovered
        ? Icon(AppIcons.openInNew, size: _trailingIconSize, color: textStyle.color)
        : SizedBox(width: _trailingIconSize)
    );
  }

  void _launch() async {
    Uri uri = Uri.parse(link ?? text);
    if (await canLaunchUrl(uri))
      launchUrl(uri);
  }
}