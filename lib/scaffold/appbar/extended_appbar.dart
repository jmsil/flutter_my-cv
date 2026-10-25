import 'package:flutter/widgets.dart';

import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_model.dart';
import '../main_profile_info.dart';
import 'appbar_model.dart';
import 'profile_photo.dart';

class ExtendedAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final MainProfileInfoStyle mainProfileInfoStyle = layout.showTopbarBackground
      ? MainProfileInfoStyle.extendedTopAppbar
      : MainProfileInfoStyle.extendedFlatAppbar;

    Widget builtWidget = Row(
      children: [
        ProfilePhotoAppbarStateSwitcher(),
        Expanded(
          child: AppbarAnimatedPadding(
            padding: const AppEdgeInsets.large(left: 0, vertical: 36),
            topFactor: 0.25,
            bottomFactor: 0.5,
            child: Row(
              children: [
                Spacer(flex: 1),
                MainProfileInfo.nameAndRoles(style: mainProfileInfoStyle, isShortRoles: false),
                Spacer(flex: 2),
                Expanded(
                  flex: 16,
                  child: MainProfileInfo.professionalSummary(style: mainProfileInfoStyle)
                )
              ]
            )
          )
        )
      ]
    );

    if (layout.showTopbarBackground) {
      builtWidget = AppContainer(
        color: theme.brand1.baseColor,
        borderRadius: BorderRadius.horizontal(
          left: const Radius.circular(ProfilePhotoAppbarStateSwitcher.circleRadiusSize),
          right: AppTheme.radius
        ),
        child: builtWidget
      );
    }

    return AppbarAnimatedContainer(builtWidget);
  }
}