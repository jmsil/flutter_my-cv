import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class MappingsProject extends Project {
  MappingsProject() : super(
    Strings.integrationProjectMappingsTitle,
    StringsModel.strings.integrationProjectMappingsDescription,
    StringsModel.strings.integrationProjectMappingsInfo,
    AppAssets.mappingsAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(assets, [3, 4]),
      ProjectImageWidget(assets.getFile(5)),
      ProjectCodeWidget(assets, [6, 7])
    ];
  }
}