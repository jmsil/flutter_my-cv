import 'package:flutter/widgets.dart';

import '../../ui/assets.dart';
import '../../ui/strings/strings_model.dart';
import '../../ui/viewer/project.dart';
import '../../ui/viewer/project_code.dart';
import '../../ui/viewer/project_image.dart';

class OAuth2TokensHandlerProject extends InfoProject {
  OAuth2TokensHandlerProject() : super(
    Strings.sapIsProjectOAuth2TokensHandlerTitle,
    StringsModel.strings.sapIsProjectOAuth2TokensHandlerDescription,
    StringsModel.strings.sapIsProjectOAuth2TokensHandlerInfo,
    AppAssets.oAuth2TokensHandlerAssets
  );

  @override
  List<Widget> buildPlaceholderWidgets() {
    return [
      ProjectImageWidget(assets.getFile(1)),
      ProjectCodeWidget(assets, [2, 3])
    ];
  }
}