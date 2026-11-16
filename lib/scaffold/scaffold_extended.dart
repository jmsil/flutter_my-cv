import 'package:flutter/widgets.dart';

import '../content/profile_header.dart';
import '../ui/container.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/layout_model.dart';
import 'appbar/appbar_extended.dart';
import 'appbar/appbar_model.dart';
import 'scaffold_groups.dart';
import 'sidebar/sidebar.dart';

class AppScaffoldExtended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final Brightness themeMode = LayoutModel.themeMode;
    final AppTheme theme = LayoutModel.theme;
    final double headerSpacing = themeMode.isLight ? AppDimens.small : AppDimens.normal;

    Widget builtWidget = Padding(
      padding: AppEdgeInsets.xLarge(top: AppDimens.xLarge - headerSpacing, bottom: 0),
      child: Center(
        child: SizedBox(
          width: 1200,
          child: AppScaffoldGroupsView(null)
        )
      )
    );

    if (layoutMode.isLeft) {
      builtWidget = Column(
        spacing: headerSpacing,
        children: [
          AppCard(
            theme: theme,
            padding: const AppEdgeInsets.large(),
            child: ProfileHeader.professionalSummary(
              enableIcon: true,
              style: ProfileHeaderStyle.body
            )
          ),
          Expanded(child: builtWidget)
        ]
      );
    }

    builtWidget = Row(
      spacing: layoutMode.isLeft ? AppDimens.normal : 0,
      children: [
        AppSidebar(),
        Expanded(child: builtWidget)
      ]
    );

    if ( ! layoutMode.isLeft) {
      builtWidget = Column(
        spacing: headerSpacing,
        children: [
          AppbarExtended(),
          Expanded(child: builtWidget)
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: AppbarModel(builtWidget)
    );
  }
}