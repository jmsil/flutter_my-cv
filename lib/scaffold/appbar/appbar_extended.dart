import 'package:flutter/widgets.dart';

import '../../ui/container.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_model.dart';
import 'appbar_model.dart';
import 'profile_details.dart';
import 'profile_header.dart';
import 'profile_photo.dart';

class AppbarExtended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final AppThemeData themeData = LayoutModel.theme.appbar;

    Widget builtWidget = Column(
      children: [
        AppbarAnimatedContainer(
          Row(
            children: [
              ProfilePhoto(
                margin: const AppEdgeInsets.normal(),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppbarModel.collapsedHeight / 2 - AppDimens.normal)),
                onPressed: () => AppbarModel.switchStateOf(context)
              ),
              Flexible(child: layoutMode.isLeft
                ? _LeftProfile()
                : _TopProfile(layoutMode.isFlat
                    ? ProfileHeaderStyle.extendedFlatAppbar
                    : ProfileHeaderStyle.extendedAppbar
                  )
              )
            ]
          )
        ),
        ProfileDetails(layoutMode.isLeft
          ? ProfileDetailsStyle.appbarVertical
          : ProfileDetailsStyle.appbarHorizontal
        )
      ]
    );

    if ( ! layoutMode.isFlat) {
      builtWidget = AppContainer.gradient(
        color: themeData.surfaceColor1,
        borderColor: layoutMode.isLeft ? null : themeData.over1.color.withDecorationAlpha,
        borderRadius: AppTheme.allBorderRadius,
        gradientColor: themeData.over1.color,
        child: builtWidget
      );
    }

    return builtWidget;
  }
}

class _LeftProfile extends AppbarAnimatedPadding {
  _LeftProfile() : super(
    padding: const AppEdgeInsets.xxLarge(left: AppDimens.small, right: 0),
    topFactor: 0,
    bottomFactor: 1,
    child: AppbarAnimatedOpacity(
      ProfileHeader.nameAndRoles(
        style: ProfileHeaderStyle.extendedAppbar,
        isShortRoles: true,
        softWrap: false
      )
    )
  );
}

class _TopProfile extends AppbarAnimatedPadding {
  _TopProfile(
    ProfileHeaderStyle style
  ) : super(
    padding: const AppEdgeInsets.large(left: 0, vertical: 36),
    topFactor: 0.25,
    bottomFactor: 0.5,
    child: Row(
      children: [
        Spacer(flex: 1),
        ProfileHeader.nameAndRoles(style: style, isShortRoles: false),
        Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: ProfileHeader.professionalSummary(enableIcon: false, style: style)
        )
      ]
    )
  );
}