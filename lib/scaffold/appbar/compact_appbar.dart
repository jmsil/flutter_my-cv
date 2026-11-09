import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/divider.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_theme_model.dart';
import '../../ui/strings/strings_model.dart';
import '../device.dart';
import '../main_profile_info.dart';

class CompactAppbar extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal();
  static const double _photoSize = 110;
  static const double _dividerSize = 2;
  static final double _collapsedHeight =
    _padding.vertical +
    _photoSize +
    _dividerSize * AppDivider.heightFactor +
    AppDimens.normal * 2;

  final GlobalKey<DrawerControllerState> drawerKey;

  CompactAppbar(this.drawerKey);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutThemeModel.theme;
    final double screenWidth = context.screenSize.width;

    final Text summaryTextWidget = Text(
      StringsModel.strings.professionalSummaryInfo,
      style: DefaultTextStyle.of(context).style.merge(theme.brand1.overStyled1.largeText.regular)
    );

    final double summaryBoxHeight = _getTextBoxHeight(
      summaryTextWidget,
      screenWidth - _padding.horizontal
    );

    final Widget profileWidget = Row(
      spacing: AppDimens.large,
      children: [
        SizedBox(
          height: _photoSize,
          child: ProfilePhoto(
            cacheSize: (_photoSize - ProfilePhoto.borderSize * 2).toInt(),
            onPressed: () => drawerKey.currentState?.open(),
          )
        ),
        MainProfileInfo.nameAndRoles(
          style: MainProfileInfoStyle.compactAppbar,
          isShortRoles: screenWidth <= 430
        )
      ]
    );

    return SliverAppBar(
      stretch: true,
      collapsedHeight: _collapsedHeight,
      expandedHeight: _collapsedHeight + summaryBoxHeight,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      flexibleSpace: ColoredBox(
        color: theme.brand1.surfaceColor,
        isAntiAlias: false,
        child: Padding(
          padding: _padding,
          child: Column(
            spacing: AppDimens.normal,
            children: [
              profileWidget,
              AppDivider(_dividerSize, theme.brand1.over1.color),
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