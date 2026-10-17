import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class InterStatementOauth2MtlsProject extends Project {
  InterStatementOauth2MtlsProject() : super(
    Strings.integrationProjectInterStatementOauth2MtlsTitle,
    StringsModel.strings.integrationProjectInterStatementOauth2MtlsDescription,
    StringsModel.strings.integrationProjectInterStatementOauth2MtlsInfo,
    AppAssets.interStatementOauth2MtlsAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1))
    ];
  }
}