import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/theme.dart';

class ProfilePhoto extends StatelessWidget {
  final bool withMargin;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;

  ProfilePhoto({
    required this.withMargin,
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
        margin: withMargin ? const ThemedEdgeInsets.normal() : null,
        borderSize: 2,
        borderColor: AppTheme.lightBlue,
        borderRadius: borderRadius ?? AppUiConst.circleBorderRadius,
        isClipped: true,
        child: child
      )
    );
  }
}