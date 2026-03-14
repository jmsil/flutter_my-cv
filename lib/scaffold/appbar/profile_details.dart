import 'package:flutter/widgets.dart';

import '../../ui/divider.dart';
import '../../ui/strings.dart';
import '../../ui/theme.dart';
import '../main_scaffold.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDesktopScreen = context.isDesktopScreen;
    final bool isSmallMobileScreen = context.isSmallMobileScreen;

    final TextStyle textStyle = isDesktopScreen
      ? AppTheme.xLargeLightBlueStyle
      : AppTheme.lightBlueStyle;

    final List<Widget> children = [
      Text(
        AppStrings.personalName,
        style: isDesktopScreen
          ? AppTheme.xxLargeLightBlueBoldStyle
          : AppTheme.largeLightBlueBoldStyle
      ),
      AppDivider(4)
    ];

    final Widget flutterRole = Text(
      AppStrings.flutterRole(isSmallMobileScreen), style: textStyle
    );
    final Widget integrationRole = Text(
      AppStrings.integrationRole(isSmallMobileScreen), style: textStyle
    );

    if (isDesktopScreen) {
      Widget roles = Expanded(
        child: Column(
          spacing: AppTheme.smallSpacingValue,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flutterRole,
            integrationRole
          ]
        )
      );
      children.add(roles);
    }
    else {
      children.add(flutterRole);
      children.add(integrationRole);
    }

    return Column(
      spacing: AppTheme.smallSpacingValue / (isDesktopScreen ? 1 : 2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
    );
  }
}