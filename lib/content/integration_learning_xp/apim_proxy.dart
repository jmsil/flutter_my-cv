import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';
import '../../ui/viewer/project_swagger.dart';

class ApimProxyProject extends InfoProject {
  ApimProxyProject() : super(
    Strings.integrationProjectApimProxyTitle,
    StringsModel.strings.integrationProjectApimProxyDescription,
    StringsModel.strings.integrationProjectApimProxyInfo,
    AppAssets.apimProxyAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectSwaggerWidget()
    ];
  }
}