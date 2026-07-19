import 'package:flutter/material.dart';

import '../../ui/strings/strings_provider.dart';
import '../../ui/theme/theme.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection(AppTheme theme)
    : super(
        theme: theme,
        startOpen: false,
        title: StringsProvider.strings.aboutAndExpectationsTitle,
        contentWidget: Text(
          StringsProvider.strings.aboutAndExpectationsInfo,
          style: theme.text1OverSectionColor1Style
        )
      );
}