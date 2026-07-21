import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/layout/theme.dart';
import '../main_profile_info.dart';
import 'animated_container.dart';
import 'animated_padding.dart';
import 'profile_photo.dart';
import 'state_provider.dart';

class DesktopAppbar extends StatelessWidget {
  static const double _neededSummaryHeight = 154;
  static const double _profileAndSummaryPaddingValue =
    (AppbarStateProvider.collapsedHeight - _neededSummaryHeight) / 2;
  static const EdgeInsets _profileAndSummaryPadding = const AppEdgeInsets.large(
    left: 0, vertical: _profileAndSummaryPaddingValue
  );

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;

    final Widget child = Row(
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
                  isCompactMode: false,
                  isShortRoles: false
                ),
                Expanded(flex: 2, child: const SizedBox()),
                Expanded(
                  flex: 16,
                  child: MainProfileInfo.professionalSummary(isOverBackground: false)
                )
              ]
            )
          )
        )
      ]
    );

    return layout.hasTopbar
      ? AppbarAnimatedContainer(
          AppContainer(
            color: theme.elementColor1,
            borderRadius: BorderRadius.horizontal(
              left: const Radius.circular(ProfilePhotoAppbarStateSwitcher.circleRadiusSize),
              right: AppTheme.radius
            ),
            hasShadow: true,
            isClipped: true,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Image.memory(AppAssets.background, fit: BoxFit.cover)
                ),
                child
              ]
            )
          )
        )
      : AppbarAnimatedContainer(child);
  }
}