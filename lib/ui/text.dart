import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urll;

import 'button.dart';
import 'const.dart';
import 'theme.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;

  AppIconText({
    required this.icon,
    required this.text,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppTheme.smallSpacingValue,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: text.contains('\n')
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center,
      children: [
        Icon(icon, color: textStyle.color),
        Text(text, style: textStyle)
      ]
    );
  }
}



class AppLink extends StatefulWidget {
  final IconData icon;
  final String text;
  final String? link;
  final bool isDarkStyle;

  AppLink({
    this.icon = AppIcons.link,
    required this.text,
    this.link,
    required this.isDarkStyle
  });

  @override
  _AppLinkState createState() => _AppLinkState();
}

class _AppLinkState extends State<AppLink> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = widget.isDarkStyle
      ? hovered ? AppTheme.darkBlueStyle : AppTheme.darkStyle
      : hovered ? AppTheme.lightBlueStyle : AppTheme.highLightBlueStyle;

    Widget child = AppIconText(
      icon: widget.icon,
      text: widget.text,
      textStyle: textStyle
    );

    if (hovered) {
      child = Row(
        spacing: AppTheme.smallSpacingValue,
        children: [
          child,
          Icon(AppIcons.openInNew, size: 18, color: textStyle.color)
        ]
      );
    }

    return AppInkResponse(
      effectsColor: Colors.transparent,
      onPressed: launch,
      onHover: onHover,
      child: child
    );
  }

  void launch() async {
    Uri uri = Uri.parse(widget.link ?? widget.text);
    if (await urll.canLaunchUrl(uri))
      urll.launchUrl(uri);
  }

  void onHover(bool value) {
    setState(() => hovered = value);
  }
}