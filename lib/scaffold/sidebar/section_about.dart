import 'package:flutter/material.dart';

import '../../ui/layout/layout_model.dart';
import '../../ui/strings/strings_model.dart';
import 'section.dart';

class SectionAbout extends Section {
  SectionAbout() : super(
    startOpen: false,
    title: StringsModel.strings.aboutAndExpectationsTitle,
    child: Text(
      StringsModel.strings.aboutAndExpectationsInfo,
      style: LayoutModel.theme.sidebar.overStyled1.normalText.regular
    )
  );
}