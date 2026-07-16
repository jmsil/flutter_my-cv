import 'package:flutter/widgets.dart';

import '../../ui/divider.dart';
import '../../ui/layout/layout.dart';
import '../../ui/strings/strings.dart';
import '../../ui/strings/strings_provider.dart';
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
        Strings.personalName,
        style: isDesktopScreen
          ? AppTheme.xxLargeLightBlueBoldStyle
          : AppTheme.largeLightBlueBoldStyle
      ),
      AppDivider(4)
    ];

    final Widget flutterRole = Text(
      isSmallMobileScreen
        ? Strings.flutterShortRole
        : StringsProvider.strings.flutterLongRole,
      style: textStyle
    );
    final Widget integrationRole = Text(
      isSmallMobileScreen
        ? Strings.integrationShortRole
        : StringsProvider.strings.integrationLongRole,
      style: textStyle
    );

    if (isDesktopScreen) {
      Widget roles = Expanded(
        child: Column(
          spacing: AppLayout.smallSpacing,
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
      spacing: AppLayout.smallSpacing / (isDesktopScreen ? 1 : 2),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
    );
  }
}