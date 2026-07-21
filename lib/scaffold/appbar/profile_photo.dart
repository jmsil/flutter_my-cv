import 'package:flutter/material.dart';
import 'package:my_cv/scaffold/appbar/state_provider.dart';

import '../../content/profile_photo.dart';
import '../../ui/layout/edge_insets.dart';

class ProfilePhotoAppbarStateSwitcher extends StatelessWidget {
  static const double circleRadiusSize = AppbarStateProvider.collapsedHeight / 2;

  @override
  Widget build(BuildContext context) {
    return ProfilePhoto(
      margin: AppEdgeInsets.normalValue,
      borderRadius: const BorderRadius.all(
        Radius.circular(circleRadiusSize - AppEdgeInsets.normalValue)
      ),
      onPressed: () => AppbarStateProvider.switchStateOf(context)
    );
  }
}