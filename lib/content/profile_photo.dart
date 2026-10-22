import 'package:flutter/material.dart';

import '../scaffold/device.dart';
import '../ui/assets.dart';
import '../ui/button/ink_response.dart';
import '../ui/container/container.dart';
import '../ui/layout/layout_model.dart';

class ProfilePhoto extends StatelessWidget {
  static const double borderSize = 2;

  final double? margin;
  final BorderRadius? borderRadius;
  final int? cacheSize;
  final void Function()? onPressed;

  ProfilePhoto({
    this.margin,
    this.borderRadius,
    this.cacheSize,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout layout = context.appLayout;
    final AppTheme theme = layout.theme;
    Widget builtWidget = Image.memory(
      AppAssets.profilePhoto,
      fit: BoxFit.cover,
      cacheWidth: cacheSize == null
        ? null
        : (cacheSize! * context.devicePixelRatio).toInt(),
    );

    if (onPressed != null) {
      builtWidget = AppInkResponse(
        onPressed: onPressed!,
        child: builtWidget
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: AppContainer(
        margin: margin == null ? null : EdgeInsets.all(margin!),
        borderSize: borderSize,
        borderColor: layout.showTopbarBackground || layout.showSidebarBackground
          ? theme.brand1.overColor1
          : theme.background.overColor1,
        borderRadius: borderRadius ?? AppTheme.circleBorderRadius,
        isClipped: true,
        child: builtWidget
      )
    );
  }
}