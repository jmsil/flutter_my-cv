import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/divider.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme/theme.dart';
import '../main_profile_info.dart';
import '../main_scaffold.dart';

class MobileAppbar extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal();
  static const double _photoSize = 110;
  static const double _dividerSize = 2;
  static final double _collapsedHeight =
    _padding.vertical +
    _photoSize +
    _dividerSize * AppDivider.heightFactor +
    AppLayout.normalSpacing * 2;

  final void Function() onPressed;

  MobileAppbar(this.onPressed);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.providerTheme;
    final double screenWidth = context.screenWidth;
    final bool isSmallMobileScreen = context.isSmallMobileScreen;

    final Text summaryTextWidget = Text(
      StringsProvider.strings.professionalSummaryInfo,
      style: DefaultTextStyle.of(context).style.merge(theme.text2OverElement1Color1Style)
    );

    final double summaryBoxHeight = _getTextBoxHeight(
      summaryTextWidget,
      screenWidth - _padding.horizontal
    );

    final Widget profileWidget = Row(
      spacing: AppLayout.largeSpacing,
      children: [
        SizedBox(
          height: _photoSize,
          child: ProfilePhoto(onPressed: onPressed)
        ),
        IntrinsicWidth(
          child: MainProfileInfo(
            title: Strings.personalName,
            info: isSmallMobileScreen
              ? Strings.shortRoles
              : StringsProvider.strings.longRoles,
            isOverBackground: false,
            isCompactMode: true
          )
        )
      ]
    );

    return SliverAppBar(
      floating: true,
      stretch: true,
      collapsedHeight: _collapsedHeight,
      expandedHeight: _collapsedHeight + summaryBoxHeight,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: ColoredBox(
        color: theme.elementColor1,
        isAntiAlias: false,
        child: Padding(
          padding: _padding,
          child: Column(
            spacing: AppLayout.normalSpacing,
            children: [
              profileWidget,
              AppDivider(theme, _dividerSize),
              Flexible(
                child: FlexibleSpaceBar(
                  background: summaryTextWidget
                )
              )
            ]
          )
        )
      )
    );
  }

  double _getTextBoxHeight(Text text, double constraintWidth) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text.data,
        style: text.style
      ),
      textDirection: TextDirection.ltr
    );
    textPainter.layout(maxWidth: constraintWidth);
    return textPainter.height;
  }
}