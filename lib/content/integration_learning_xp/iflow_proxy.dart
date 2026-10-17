import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class IFlowProxyProject extends Project {
  IFlowProxyProject() : super(
    Strings.integrationProjectIFlowProxyTitle,
    StringsModel.strings.integrationProjectIFlowProxyDescription,
    StringsModel.strings.integrationProjectIFlowProxyInfo,
    AppAssets.iFlowProxyAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(assets, [2]),
      ProjectCodeWidget(assets, [3])
    ];
  }
}