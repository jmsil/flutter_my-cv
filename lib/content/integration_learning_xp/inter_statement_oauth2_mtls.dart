import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_image.dart';

class InterStatementOauth2MtlsProject extends InfoProject {
  InterStatementOauth2MtlsProject() : super(
    Strings.sapIsProjectInterStatementOauth2MtlsTitle,
    StringsModel.strings.sapIsProjectInterStatementOauth2MtlsDescription,
    StringsModel.strings.sapIsProjectInterStatementOauth2MtlsInfo,
    AppAssets.interStatementOauth2MtlsAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1))
    ];
  }
}