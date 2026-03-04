import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/theme.dart';

class ProfilePhoto extends StatelessWidget {
  final bool withMargin;
  final void Function()? onPressed;

  ProfilePhoto({
    required this.withMargin,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Image.asset(AppAssets.profile_photo, fit: BoxFit.cover);

    if (onPressed != null) {
      child = Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          Material(
            type: MaterialType.transparency,
            child: AppInkResponse(
              effectsColor: AppButton.effectsColor,
              onPressed: onPressed!,
            )
          )
        ]
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: AppContainer(
        margin: withMargin ? const ThemedEdgeInsets.normal() : null,
        borderSize: 2,
        borderColor: AppTheme.lightBlue,
        borderRadius: AppUiConst.circleBorderRadius,
        isClipped: true,
        child: child
      )
    );
  }
}