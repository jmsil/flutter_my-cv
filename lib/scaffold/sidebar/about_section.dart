import 'package:flutter/material.dart';

import '../../ui/layout/theme.dart';
import '../../ui/strings/strings_model.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection(
    AppTheme theme
  ) : super(
    theme: theme,
    startOpen: false,
    title: StringsModel.strings.aboutAndExpectationsTitle,
    contentWidget: Text(
      StringsModel.strings.aboutAndExpectationsInfo,
      style: theme.sidebarSection.normalText.over1.regular
    )
  );
}