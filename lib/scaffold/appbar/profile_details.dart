import 'package:flutter/widgets.dart';

import '../../ui/divider.dart';
import '../../ui/strings.dart';
import '../../ui/theme.dart';

class ProfileDetails extends StatelessWidget {
  final bool isMobileScaffold;

  ProfileDetails(this.isMobileScaffold);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = isMobileScaffold
      ? AppTheme.lightBlueStyle
      : AppTheme.xLargeLightBlueStyle;

    final List<Widget> children = [
      Text(
        AppStrings.personalName,
        style: isMobileScaffold
          ? AppTheme.largeLightBlueBoldStyle
          : AppTheme.xxLargeLightBlueBoldStyle
      ),
      AppDivider(4)
    ];

    final Widget flutterRole  = Text(AppStrings.flutterRole, style: textStyle);
    final Widget integrationRole = Text(AppStrings.integrationRole, style: textStyle);

    if (isMobileScaffold) {
      children.add(flutterRole);
      children.add(integrationRole);
    }
    else {
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

    return Column(
      spacing: AppTheme.smallSpacingValue / (isMobileScaffold ? 2 : 1),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
    );
  }
}