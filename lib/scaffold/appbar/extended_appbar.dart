import 'package:flutter/widgets.dart';

import '../../content/profile_photo.dart';
import '../../ui/container.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/layout_theme_model.dart';
import '../main_profile_info.dart';
import 'appbar_model.dart';

class ExtendedAppbar extends StatelessWidget {
  static const double _photoRadiusSize = AppbarModel.collapsedHeight / 2;

  @override
  Widget build(BuildContext context) {
    final AppLayoutMode layoutMode = LayoutThemeModel.layoutMode;
    final AppThemeData themeData = LayoutThemeModel.theme.appbar;
    final EdgeInsets margin = AppbarModel.marginOf(context);

    Widget builtWidget = layoutMode.isLeft
      ? _LeftProfile()
      : _TopProfile(layoutMode.isFlat
          ? MainProfileInfoStyle.extendedFlatAppbar
          : MainProfileInfoStyle.extendedTopAppbar
        );

    builtWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilePhoto(
          margin: AppDimens.normal,
          borderRadius: const BorderRadius.all(
            const Radius.circular(_photoRadiusSize - AppDimens.normal)
          ),
          onPressed: () => AppbarModel.switchStateOf(context)
        ),
        Flexible(child: builtWidget)
      ]
    );

    if ( ! layoutMode.isFlat) {
      builtWidget = AppContainer(
        color: themeData.surfaceColor1,
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

class _LeftProfile extends AppbarAnimatedPadding {
  _LeftProfile() : super(
    padding: const EdgeInsets.only(right: AppDimens.xLarge),
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