import 'package:flutter/material.dart';

import '../../ui/strings/strings_provider.dart';
import '../../ui/theme.dart';
import 'section.dart';

class AboutSection extends Section {
  AboutSection()
    : super(
        false,
        StringsProvider.strings.aboutAndExpectationsTitle,
        Text(StringsProvider.strings.aboutAndExpectationsInfo, style: AppTheme.highLightBlueStyle)
      );
}