import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class GoogleFirebaseAuthUsersProject extends Project {
  GoogleFirebaseAuthUsersProject() : super(
    Strings.integrationProjectGoogleFirebaseAuthUsersTitle,
    StringsModel.strings.integrationProjectGoogleFirebaseAuthUsersDescription,
    StringsModel.strings.integrationProjectGoogleFirebaseAuthUsersInfo,
    AppAssets.googleFirebaseAuthUsersAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectImageWidget(assets.getFile(3)),
      ProjectImageWidget(assets.getFile(4))
    ];
  }
}