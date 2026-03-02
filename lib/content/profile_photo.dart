import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/const.dart';
import '../ui/container/container.dart';
import '../ui/theme.dart';

class ProfilePhoto extends AspectRatio {
  ProfilePhoto(bool withMargin)
    : super(
        aspectRatio: 1,
        child: AppContainer(
          margin: withMargin ? const EdgeInsets.all(16) : null,
          borderSize: 2,
          borderColor: AppTheme.lightBlue,
          borderRadius: AppUiConst.circleBorderRadius,
          isClipped: true,
          child: Image.asset(AppAssets.profile_photo, fit: BoxFit.cover)
        )
      );
}