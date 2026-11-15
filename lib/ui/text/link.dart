import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../hover.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import 'icon_text.dart';

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
        final AppTheme theme = LayoutModel.theme;
        final TextStyle textStyle = isOverBackground
          ? hovered
            ? theme.background.accentStyled1.normalText.bold
            : theme.background.overStyled1.normalText.regular
          : hovered
            ? theme.sidebar.accentStyled1.normalText.bold
            : theme.sidebar.overStyled1.normalText.regular;

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