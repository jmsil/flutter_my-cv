import 'package:material_ui/material_ui.dart';

import '../../ui/button/button.dart';
import '../../ui/layout/dimens.dart';
import '../../ui/layout/icons.dart';
import '../../ui/layout/layout_model.dart';
import '../../ui/navigator.dart';
import '../../ui/overlay_bar.dart';
import '../../ui/scroller.dart';
import '../appbar/profile_photo.dart';

class AppSidebarCompact extends StatelessWidget {
  final List<Widget> children;

  AppSidebarCompact(this.children);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = LayoutModel.theme;
    final double collapsedHeight = AppIconButton.size + _Profile._buttonPadding.vertical;

    return Padding(
      padding: const AppEdgeInsets.normal(),
      child: OverlayBar(
        radius: AppTheme.radiusValue,
        startSize: AppTheme.radiusValue,
        startForegroundColor: theme.sidebar.surfaceColor1,
        endSize: AppTheme.radiusValue,
        endForegroundColor: theme.sidebar.surfaceColor1,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return AppCustomScrollView([
              SliverAppBar(
                pinned: true,
                stretch: true,
                toolbarHeight: collapsedHeight,
                collapsedHeight: collapsedHeight,
                expandedHeight: constraints.maxWidth,
                backgroundColor: theme.appbar.surfaceColor1,
                surfaceTintColor: Colors.transparent,
                elevation: 12,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(borderRadius: AppTheme.allBorderRadius),
                automaticallyImplyLeading: false,
                flexibleSpace: _Profile(theme)
              ),

              SliverList(
                delegate: SliverChildListDelegate(
                  children,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false
                )
              )
            ]);
          }
        )
      )
    );
  }
}

class _Profile extends Stack {
  static const EdgeInsets _buttonPadding = AppEdgeInsets.small();

  _Profile(
    AppTheme theme
  ) : super(
    clipBehavior: Clip.none,
    children: [
      Center(
        child: ProfilePhoto(margin: const AppEdgeInsets.large())
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: _buttonPadding,
          child: AppIconButton(
            icon: AppIcons.back,
            themeProperty: theme.appbar.over1,
            onPressed: AppNavigator.pop
          )
        )
      )
    ]
  );
}