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
    final AppTheme theme = LayoutModel.theme;
    final EdgeInsets padding = AppEdgeInsets.xLarge(
      top: layoutMode.isLeft
        ? null
        : AppbarModel.totalCollapsedHeightOf(context) +
            (layoutMode.isFlat ? AppDimens.normal : AppDimens.xLarge),
      bottom: 0
    );

    Widget builtWidget = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: AppScaffoldGroupsView(null)
      )
    );

    builtWidget = layoutMode.isLeft
      ? Column(
          children: [
            AppCard(
              theme: theme,
              padding: const AppEdgeInsets.large(),
              child: ProfileHeader.professionalSummary(
                hasIcon: true,
                style: ProfileHeaderStyle.body
              )
            ),
            Expanded(
              child: Padding(
                padding: padding,
                child: builtWidget
              )
            )
          ]
        )
      : AppbarAnimatedPadding(
          padding: padding,
          child: builtWidget
        );

    builtWidget = Row(
      spacing: layoutMode.isLeft ? AppDimens.normal : 0,
      children: [
        AppSidebar(),
        Expanded(child: builtWidget)
      ]
    );

    if ( ! layoutMode.isLeft) {
      builtWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          builtWidget,
          AppbarExtended()
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: AppbarModel(builtWidget)
    );
  }
}