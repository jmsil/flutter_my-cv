import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class SqlServerXsltProject extends Project {
  SqlServerXsltProject() : super(
    Strings.integrationProjectSqlServerWithXsltTitle,
    StringsModel.strings.integrationProjectSqlServerWithXsltDescription,
    StringsModel.strings.integrationProjectSqlServerWithXsltInfo,
    AppAssets.sqlServerWithXsltAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectImageWidget(assets.getFile(2)),
      ProjectCodeWidget(assets, [3, 4, 5], [4, 7, 7])
    ];
  }
}