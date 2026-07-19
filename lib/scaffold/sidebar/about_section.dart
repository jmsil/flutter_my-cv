import 'package:flutter/material.dart';

import '../../ui/layout/layout_provider.dart';
import '../../ui/strings/strings_provider.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection()
    : super(
        false,
        StringsProvider.strings.aboutAndExpectationsTitle,
        Text(
          StringsProvider.strings.aboutAndExpectationsInfo,
          style: LayoutProvider.theme.text1OverSectionColor1Style
        )
      );
}