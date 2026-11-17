import 'package:material_ui/material_ui.dart';

import '../../ui/container.dart';
import '../../ui/divider.dart';
import '../../ui/layout/device.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import 'profile_header.dart';
import 'profile_photo.dart';

class AppbarCompact extends StatelessWidget {
  static const EdgeInsets _padding = AppEdgeInsets.normal();
  static const double _photoSize = 110;
  static const double _dividerSize = 2;
  static final double _collapsedHeight =
    _padding.vertical +
    _photoSize +
    _dividerSize * AppDivider.sizeFactor +
    AppDimens.normal * 2;

  final GlobalKey<DrawerControllerState> drawerKey;

  AppbarCompact(this.drawerKey);

  @override
  Widget build(BuildContext context) {
    final AppThemeData themeData = LayoutModel.theme.appbar;
    final double screenWidth = context.screenSize.width;

    final Text summaryTextWidget = Text(
      StringsModel.strings.professionalSummaryInfo,
      style: DefaultTextStyle.of(context).style.merge(themeData.overStyled1.largeText.regular)
    );

    final double summaryBoxHeight = _getTextBoxHeight(
      summaryTextWidget,
      screenWidth - _padding.horizontal
    );

    final Widget profileWidget = Row(
      spacing: AppDimens.large,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ProfilePhoto(
              size: _photoSize,
              cacheSize: (_photoSize - ProfilePhoto.borderSize * 2).toInt(),
              onPressed: () => drawerKey.currentState?.open()
            ),
            AppContainer(
              color: themeData.over1.color,
              padding: const AppEdgeInsets.xSmall(),
              borderSize: ProfilePhoto.borderSize * 1.25,
              borderColor: themeData.surfaceColor1,
              borderRadius: AppTheme.circleBorderRadius,
              child: Icon(AppIcons.menu, size: 16, color: themeData.surfaceColor1)
            )
          ]
        ),
        Expanded(
          child: ProfileHeader.nameAndRoles(
            style: ProfileHeaderStyle.compactAppbar,
            isShortRoles: screenWidth <= 430
          )
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
        color: themeData.surfaceColor1,
        isAntiAlias: false,
        child: Padding(
          padding: _padding,
          child: Column(
            spacing: AppDimens.normal,
            children: [
              profileWidget,
              AppDivider(_dividerSize, themeData.over1.color),
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