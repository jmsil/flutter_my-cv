import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button/ink_response.dart';
import '../ui/container/container.dart';
import '../ui/layout/layout_provider.dart';

class ProfilePhoto extends StatelessWidget {
  final double? margin;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  ProfilePhoto({
    this.margin,
    this.borderRadius,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    Widget builtWidget = Image.memory(AppAssets.profilePhoto, fit: BoxFit.cover);

    if (onPressed != null) {
      builtWidget = AppInkResponse(
        effectsColor: Colors.transparent,
        onPressed: onPressed!,
        child: builtWidget
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: AppContainer(
        margin: margin == null ? null : EdgeInsets.all(margin!),
        borderSize: 2,
        borderColor: layout.showTopbarBackground || layout.showSidebarBackground
          ? theme.overElement1Color1
          : theme.overBackgroundColor1,
        borderRadius: borderRadius ?? AppTheme.circleBorderRadius,
        isClipped: true,
        child: builtWidget
      )
    );
  }
}