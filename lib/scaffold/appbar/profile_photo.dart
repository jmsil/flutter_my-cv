import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/button/ink_response.dart';
import '../../ui/container.dart';
import '../../ui/layout/device.dart';
import '../../ui/layout/layout_model.dart';

class ProfilePhoto extends StatelessWidget {
  static const double borderSize = 2;

  final double? size;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final int? cacheSize;
  final void Function()? onPressed;

  ProfilePhoto({
    this.size,
    this.margin,
    this.borderRadius,
    this.cacheSize,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final LayoutMode layoutMode = LayoutModel.layoutMode;
    final Brightness themeMode = LayoutModel.themeMode;
    final AppTheme theme = LayoutModel.theme;

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

    builtWidget = AppContainer(
      width: size, height: size,
      margin: margin,
      borderSize: borderSize,
      borderColor: layoutMode.isFlat && themeMode.isLight
        ? theme.background.over1.color
        : theme.appbar.over1.color,
      borderRadius: borderRadius ?? AppTheme.circleBorderRadius,
      enableClip: true,
      child: builtWidget
    );

    return size == null
      ? AspectRatio(aspectRatio: 1, child: builtWidget)
      : builtWidget;
  }
}