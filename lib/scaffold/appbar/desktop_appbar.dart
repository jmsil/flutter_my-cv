import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/divider.dart';
import '../../ui/strings/strings_provider.dart';
import '../../ui/theme.dart';
import 'animated_container.dart';
import 'animated_padding.dart';
import 'profile_details.dart';
import 'state_provider.dart';

class DesktopAppbar extends StatelessWidget {
  static const double _neededSummaryHeight = 154;
  static const double _profileAndSummaryPaddingValue =
    (AppbarStateProvider.collapsedHeight - _neededSummaryHeight) / 2;
  static const EdgeInsets _profileAndSummaryPadding = const EdgeInsets.fromLTRB(
    0, _profileAndSummaryPaddingValue, ThemedEdgeInsets.largeValue, _profileAndSummaryPaddingValue
  );

  @override
  Widget build(BuildContext context) {
    const double circleRadiusSize = AppbarStateProvider.collapsedHeight / 2;

    final Widget backgroundImage = RotatedBox(
      quarterTurns: -1,
      child: Image.memory(AppAssets.background, fit: BoxFit.cover)
    );

    final Widget profilePhoto = ProfilePhoto(
      margin: ThemedEdgeInsets.normalValue,
      borderRadius: const BorderRadius.all(
        Radius.circular(circleRadiusSize - ThemedEdgeInsets.normalValue)
      ),
      onPressed: () => AppbarStateProvider.switchStateOf(context)
    );

    final Widget professionalSummary = Column(
      spacing: AppTheme.smallSpacingValue,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsProvider.strings.professionalSummaryTitle,
          style: AppTheme.xxLargeLightBlueBoldStyle
        ),
        AppDivider(4),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              StringsProvider.strings.professionalSummaryInfo,
              style: AppTheme.xLargeLightBlueStyle
            )
          )
        )
      ]
    );

    return AppbarAnimatedContainer(
      child: AppContainer(
        color: AppTheme.highDarkColor,
        borderRadius: const BorderRadius.horizontal(
          left: const Radius.circular(circleRadiusSize),
          right: const Radius.circular(AppTheme.radiusValue)
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
                          child: ProfileDetails()
                        ),
                        Expanded(flex: 2, child: const SizedBox()),
                        Expanded(
                          flex: 16,
                          child: professionalSummary
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