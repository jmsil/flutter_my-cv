import 'package:flutter/material.dart';

import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_model.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection(
    AppThemeData themeData
  ) : super(
    themeData: themeData,
    startOpen: false,
    title: StringsModel.strings.aboutAndExpectationsTitle,
    contentWidget: Text(
      StringsModel.strings.aboutAndExpectationsInfo,
      style: themeData.overStyled1.normalText.regular
    )
  );
}