import 'package:flutter/widgets.dart';

import '../layout/dimens.dart';
import '../layout/icons.dart';

class AppIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle textStyle;
  final enableCompactIcon;
  final bool enableOverflow;
  final Widget? trailingWidget;

  AppIconText({
    required this.icon,
    required this.text,
    required this.textStyle,
    this.enableOverflow = false,
    this.trailingWidget
  }) :
    this.enableCompactIcon = false;

  AppIconText.bullet({
    required this.text,
    required this.textStyle,
    this.enableCompactIcon = false
  }) :
    this.icon = AppIcons.bullet,
    this.enableOverflow = false,
    this.trailingWidget = null;

  @override
  Widget build(BuildContext context) {
    Align();
    return Row(
      spacing: enableCompactIcon ? AppDimens.xxSmall : AppDimens.small,
      mainAxisSize: MainAxisSize.min,
      children: [

        icon == AppIcons.bullet
          ? SizedBox.square(
              dimension: 24,
              child: Center(
                child: Icon(icon, size: enableCompactIcon? 7.5 : 9.5, color: textStyle.color)
              )
            )
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