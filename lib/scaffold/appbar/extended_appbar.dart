import 'package:flutter/widgets.dart';

import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_model.dart';
import '../main_profile_info.dart';
import 'appbar_model.dart';
import 'profile_photo.dart';

class ExtendedAppbar extends StatelessWidget {
  static const double _neededSummaryHeight = 154;
  static const double _profileAndSummaryPaddingValue =
    (AppbarModel.collapsedHeight - _neededSummaryHeight) / 2;
  static const EdgeInsets _profileAndSummaryPadding = const AppEdgeInsets.large(
    left: 0, vertical: _profileAndSummaryPaddingValue);

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final MainProfileInfoStyle mainProfileInfoStyle = layout.showTopbarBackground
      ? MainProfileInfoStyle.extendedAppbarElement
      : MainProfileInfoStyle.extendedAppbarBackground;

    Widget builtWidget = Row(
      children: [
        ProfilePhotoAppbarStateSwitcher(),
        Expanded(
          child: AppbarAnimatedPadding(
            padding: _profileAndSummaryPadding,
            topFactor: 0.25,
            bottomFactor: 0.5,
            child: Row(
              children: [
                Expanded(flex: 1, child: const SizedBox()),
                MainProfileInfo.nameAndRoles(
                  style: mainProfileInfoStyle,
                  isShortRoles: false
                ),
                Expanded(flex: 2, child: const SizedBox()),
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