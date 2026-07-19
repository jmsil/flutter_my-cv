import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button/ink_response.dart';
import '../ui/container/container.dart';
import '../ui/layout/layout_provider.dart';
import '../ui/theme/theme.dart';

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
    Widget child = Image.memory(AppAssets.profilePhoto, fit: BoxFit.cover);

    if (onPressed != null) {
      child = AppInkResponse(
        effectsColor: Colors.transparent,
        onPressed: onPressed!,
        child: child
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: AppContainer(
      margin: margin == null ? null : EdgeInsets.all(margin!),
        borderSize: 2,
        borderColor: LayoutProvider.theme.overElement1Color1,
        borderRadius: borderRadius ?? AppTheme.circleBorderRadius,
        isClipped: true,
        child: child
      )
    );
  }
}