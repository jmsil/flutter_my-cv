import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/divider.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme.dart';
import '../main_scaffold.dart';
import 'profile_details.dart';

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
    final double screenWidth = context.screenWidth;

    final Text summaryTextWidget = Text(
      StringsProvider.strings.professionalSummaryInfo,
      style: DefaultTextStyle.of(context).style.merge(AppTheme.largeLightBlueStyle)
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
          child: ProfileDetails()
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
        color: AppTheme.highDarkColor,
        isAntiAlias: false,
        child: Padding(
          padding: _padding,
          child: Column(
            spacing: AppLayout.normalSpacing,
            children: [
              profileWidget,
              AppDivider(_dividerSize),
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