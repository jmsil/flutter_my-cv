import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/container/container.dart';
import '../../ui/divider.dart';
import '../../ui/strings.dart';
import '../../ui/theme.dart';
import 'profile_details.dart';

class MobileAppbar extends StatelessWidget {
  final void Function() onPressed;

  MobileAppbar(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: AppTheme.highDarkColor,
      padding: const ThemedEdgeInsets.normal(bottom: ThemedEdgeInsets.xLargeValue),
      child: Column(
        spacing: AppTheme.normalSpacingValue,
        children: [
          Row(
            spacing: AppTheme.xLargeSpacingValue,
            children: [
              SizedBox(
                height: 110,
                child: ProfilePhoto(
                  withMargin: false,
                  onPressed: onPressed
                )
              ),
              IntrinsicWidth(
                child: ProfileDetails(true)
              )
            ]
          ),
          AppDivider(2),
          Text(AppStrings.professionalSummaryInfo, style: AppTheme.largeLightBlueStyle)
        ]
      )
    );
  }
}