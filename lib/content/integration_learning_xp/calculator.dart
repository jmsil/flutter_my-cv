import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class CalculatorProject extends Project {
  CalculatorProject() : super(
    Strings.integrationProjectCalculatorTitle,
    StringsModel.strings.integrationProjectCalculatorDescription,
    StringsModel.strings.integrationProjectCalculatorInfo,
    AppAssets.calculatorAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectImageWidget(assets.getFile(3))
    ];
  }
}