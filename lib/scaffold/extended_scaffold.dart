import 'package:flutter/material.dart';

import '../ui/container.dart';
import '../ui/layout/dimens.dart';
import '../ui/layout/layout_model.dart';
import 'appbar/appbar_model.dart';
import 'appbar/extended_appbar.dart';
import 'main_profile_info.dart';
import 'scaffold.dart';
import 'sidebar/sidebar.dart';

class ExtendedScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final EdgeInsets padding = AppEdgeInsets.xLarge(
      top: layout.isLeftLayout
        ? null
        : AppbarModel.totalCollapsedHeightOf(context) +
            (layout.isFlatLayout ? AppDimens.normal : AppDimens.xLarge),
      bottom: 0
    );

    Widget builtWidget = Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: AppScaffoldGroupsView(null)
      )
    );

    builtWidget = layout.isLeftLayout
      ? Column(
          children: [
            AppCard(
              theme: theme,
              padding: const AppEdgeInsets.large(),
              child: MainProfileInfo.professionalSummary(
                hasIcon: true,
                style: MainProfileInfoStyle.body
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
      spacing: layout.isLeftLayout ? AppDimens.normal : 0,
      children: [
        AppSidebar(),
        Expanded(child: builtWidget)
      ]
    );

    if ( ! layout.isLeftLayout) {
      builtWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          builtWidget,
          ExtendedAppbar()
        ]
      );
    }

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: AppbarModel(builtWidget)
    );
  }
}