import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urll;

import 'button.dart';
import 'theme.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSidebar;
  final bool isLink;

  AppIconText(this.icon, this.text, this.isSidebar, [this.isLink = false]);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = isSidebar ? AppTheme.highLightBlueStyle : AppTheme.darkStyle;

    return Row(
      spacing: AppTheme.smallSpacingValue,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: textStyle.color),
        isLink
          ? AppLink(text, isSidebar)
          : Text(text, style: textStyle)
      ]
    );
  }
}

class AppLink extends StatefulWidget {
  final String text;
  final bool isSidebar;

  AppLink(this.text, this.isSidebar);

  @override
  _AppLinkState createState() => _AppLinkState();
}

class _AppLinkState extends State<AppLink> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return AppInkResponse(
      effectsColor: Colors.transparent,
      cursor: SystemMouseCursors.click,
      onPressed: launch,
      onHover: onHover,
      child: Text(
        widget.text,
        style: widget.isSidebar
          ? hovered ? AppTheme.lightBlueStyle : AppTheme.highLightBlueStyle
          : hovered ? AppTheme.darkBlueStyle : AppTheme.darkStyle
      )
    );
  }

  void launch() async {
    Uri uri = Uri.parse(widget.text);
    if (await urll.canLaunchUrl(uri))
      urll.launchUrl(uri);
  }

  void onHover(bool value) {
    setState(() => hovered = value);
  }
}