import 'package:flutter/material.dart';

import '../../content/profile_photo.dart';
import '../../ui/layout/edge_insets.dart';
import 'appbar_model.dart';

class ProfilePhotoAppbarStateSwitcher extends StatelessWidget {
  static const double circleRadiusSize = AppbarModel.collapsedHeight / 2;

  @override
  Widget build(BuildContext context) {
    return ProfilePhoto(
      margin: AppEdgeInsets.normalValue,
      borderRadius: const BorderRadius.all(
        Radius.circular(circleRadiusSize - AppEdgeInsets.normalValue)
      ),
      onPressed: () => AppbarModel.switchStateOf(context)
    );
  }
}