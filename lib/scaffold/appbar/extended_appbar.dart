import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/container.dart';
import '../../ui/layout/edge_insets.dart';
import '../../ui/layout/layout_model.dart';
import '../main_profile_info.dart';
import 'appbar_model.dart';

class ExtendedAppbar extends StatelessWidget {
  static const double _photoRadiusSize = AppbarModel.collapsedHeight / 2;

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    final EdgeInsets margin = AppbarModel.marginOf(context);

    Widget builtWidget = layout.isLeftLayout
      ? _LeftProfile()
      : _TopProfile(layout.showTopbarBackground
          ? MainProfileInfoStyle.extendedTopAppbar
          : MainProfileInfoStyle.extendedFlatAppbar
        );

    builtWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilePhoto(
          margin: AppEdgeInsets.normalValue,
          borderRadius: const BorderRadius.all(
            const Radius.circular(_photoRadiusSize - AppEdgeInsets.normalValue)
          ),
          onPressed: () => AppbarModel.switchStateOf(context)
        ),
        Flexible(child: builtWidget)
      ]
    );

    if ( ! layout.isFlatLayout) {
      builtWidget = AppContainer(
        color: theme.brand1.baseColor,
        borderRadius: BorderRadius.horizontal(
          left: const Radius.circular(_photoRadiusSize),
          right: AppTheme.radius
        ),
        child: builtWidget
      );
    }

    return AppbarAnimatedContainer(
      margin: margin,
      child: builtWidget
    );
  }
}

class _TopProfile extends AppbarAnimatedPadding {
  _TopProfile(
    MainProfileInfoStyle style
  ) : super(
    padding: const AppEdgeInsets.large(left: 0, vertical: 36),
    topFactor: 0.25,
    bottomFactor: 0.5,
    child: Row(
      children: [
        Spacer(flex: 1),
        MainProfileInfo.nameAndRoles(style: style, isShortRoles: false),
        Spacer(flex: 2),
        Expanded(
          flex: 16,
          child: MainProfileInfo.professionalSummary(hasIcon: false, style: style)
        )
      ]
    )
  );
}

class _LeftProfile extends AppbarAnimatedPadding {
  _LeftProfile() : super(
    padding: const EdgeInsets.only(right: AppEdgeInsets.xLargeValue),
    topFactor: 0,
    bottomFactor: 1,
    child: AppbarAnimatedOpacity(
      MainProfileInfo.nameAndRoles(
        style: MainProfileInfoStyle.compactAppbar,
        isShortRoles: true,
        softWrap: false
      )
    )
  );
}