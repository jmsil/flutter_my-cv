import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_provider.dart';
import '../../ui/layout/theme.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
import '../main_profile_info.dart';
import 'animated_container.dart';
import 'animated_padding.dart';
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
    final AppTheme theme = context.appLayout.theme;
    const double circleRadiusSize = AppbarStateProvider.collapsedHeight / 2;

    final Widget backgroundImage = RotatedBox(
      quarterTurns: -1,
      child: Image.memory(AppAssets.background, fit: BoxFit.cover)
    );

    final Widget profilePhoto = ProfilePhoto(
      margin: AppEdgeInsets.normalValue,
      borderRadius: const BorderRadius.all(
        Radius.circular(circleRadiusSize - AppEdgeInsets.normalValue)
      ),
      onPressed: () => AppbarStateProvider.switchStateOf(context)
    );

    final Widget nameAndRolesWidget = MainProfileInfo(
      title: Strings.personalName,
      info: StringsProvider.strings.longRoles,
      isOverBackground: false,
      isCompactMode: false
    );

    final Widget professionalSummaryWidget = MainProfileInfo(
      title: StringsProvider.strings.professionalSummaryTitle,
      info: StringsProvider.strings.professionalSummaryInfo,
      isOverBackground: false,
      isCompactMode: false,
    );

    return AppbarAnimatedContainer(
      child: AppContainer(
        color: theme.elementColor1,
        borderRadius: BorderRadius.horizontal(
          left: const Radius.circular(circleRadiusSize),
          right: AppTheme.radius
        ),
        hasShadow: true,
        isClipped: true,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            backgroundImage,
            Row(
              children: [
                profilePhoto,
                Expanded(
                  child: AppbarAnimatedPadding(
                    padding: _profileAndSummaryPadding,
                    topFactor: 0.25,
                    bottomFactor: 0.5,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: const SizedBox()),
                        IntrinsicWidth(
                          child: nameAndRolesWidget
                        ),
                        Expanded(flex: 2, child: const SizedBox()),
                        Expanded(
                          flex: 16,
                          child: professionalSummaryWidget
                        )
                      ]
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}