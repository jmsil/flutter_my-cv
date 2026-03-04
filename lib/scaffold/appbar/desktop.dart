import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/assets.dart';
import '../../ui/container/container.dart';
import '../../ui/divider.dart';
import '../../ui/strings.dart';
import '../../ui/theme.dart';
import 'animated_container.dart';
import 'profile_details.dart';
import 'state_provider.dart';

class DesktopAppbar extends StatelessWidget {
  static const EdgeInsets margin = ThemedEdgeInsets.normal(right: 0);

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
      child: Image.asset(AppAssets.background, fit: BoxFit.cover)
    );

    final Widget profilePhoto = ProfilePhoto(
      withMargin: true,
      borderRadius: const BorderRadius.all(
        Radius.circular(circleRadiusSize - ThemedEdgeInsets.normalValue)
      ),
      onPressed: () => _onProfilePhotoPressed(context)
    );

    final Widget professionalSummary = Column(
      spacing: AppTheme.smallSpacingValue,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.professionalSummaryTitle, style: AppTheme.xxLargeLightBlueBoldStyle),
        AppDivider(4),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(AppStrings.professionalSummaryText, style: AppTheme.xLargeLightBlueStyle)
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
                  child: Padding(
                    padding: _profileAndSummaryPadding,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: const SizedBox()),
                        ProfileDetails(false),
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

  void _onProfilePhotoPressed(BuildContext context) {
    context.getInheritedWidgetOfExactType<AppbarStateProvider>()!.switchState();
  }
}