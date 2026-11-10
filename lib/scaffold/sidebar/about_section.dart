import 'package:flutter/material.dart';

import '../../ui/layout/layout_theme_model.dart';
import '../../ui/strings/strings_model.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection() : super(
    startOpen: false,
    title: StringsModel.strings.aboutAndExpectationsTitle,
    child: Text(
      StringsModel.strings.aboutAndExpectationsInfo,
      style: LayoutThemeModel.theme.sidebar.overStyled1.normalText.regular
    )
  );
}