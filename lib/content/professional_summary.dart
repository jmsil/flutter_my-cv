import 'package:flutter/material.dart';

import '../ui/const.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'group.dart';

class ProfessionalSummaryGroup extends ContentGroup {
  ProfessionalSummaryGroup()
    : super(
        icon: AppIcons.summary,
        title: AppStrings.professionalSummaryTitle,
        withPadding: true,
        scrollable: false,
        children: [
          Text(AppStrings.professionalSummaryText, style: AppTheme.darkStyle)
        ]
      );
}