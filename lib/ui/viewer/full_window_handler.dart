import 'package:flutter/material.dart';

import '../../scaffold/device.dart';
import '../button/ink_response.dart';
import '../container/container.dart';
import '../hover.dart';
import '../layout/edge_insets.dart';
import '../layout/icons.dart';
import '../layout/layout_model.dart';
import 'viewer.dart';

class AppViewerFullWindowHandler extends StatelessWidget {
  final Color iconColor;
  final Widget child;
  final Widget? fullWindowChild;

  AppViewerFullWindowHandler({
    required this.iconColor,
    required this.child,
    this.fullWindowChild
  });

  @override
  Widget build(BuildContext context) {
    return AppDevice.isMobileDevice()
      ? overlayBuilder(context, true, child)
      : AppHoverWidget(
          child: child,
          builder: overlayBuilder
        );
  }

  Widget overlayBuilder(BuildContext context, bool hovered, Widget? child) {
    final AppTheme theme = context.appLayout.theme;
    final List<Widget> children = [ child! ];

    if (hovered) {
      Widget button = Align(
        alignment: Alignment.topRight,
        child: AppContainer(
          margin: const AppEdgeInsets.small(),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          isClipped: true,
          child: AppInkResponse(
            padding: const AppEdgeInsets.small(),
            effectsColor: theme.inkEffectsColor,
            child: Icon(
              fullWindowChild == null ? AppIcons.fullWindowExit : AppIcons.fullWindow,
              color: iconColor
            ),
            onPressed: () => AppViewer.setFullWindowOf(context, fullWindowChild)
          )
        )
      );
      children.add(button);
    }

    return Stack(
      clipBehavior: Clip.none,
      children: children
    );
  }
}