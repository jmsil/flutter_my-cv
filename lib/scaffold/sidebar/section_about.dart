import 'package:flutter/widgets.dart';

import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import 'sidebar_section.dart';

class SectionAbout extends SidebarSection {
  SectionAbout() : super(
    startOpen: false,
    title: StringsModel.strings.aboutAndExpectationsTitle,
    child: Text(
      StringsModel.strings.aboutAndExpectationsInfo,
      style: LayoutModel.theme.sidebar.overStyled1.normalText.regular
    )
  );
}