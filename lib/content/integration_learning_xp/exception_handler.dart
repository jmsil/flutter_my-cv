import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class ExceptionHandlerProject extends Project {
  ExceptionHandlerProject() : super(
    Strings.integrationProjectExceptionHandlerTitle,
    StringsModel.strings.integrationProjectExceptionHandlerDescription,
    StringsModel.strings.integrationProjectExceptionHandlerInfo,
    AppAssets.exceptionHandlerAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(assets, [2])
    ];
  }
}