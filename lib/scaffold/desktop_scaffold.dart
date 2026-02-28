import 'package:flutter/material.dart';

import '../content/content.dart';
import '../content/sidebar.dart';
import '../ui/theme.dart';

class DesktopScaffold extends StatelessWidget {
  final bool isDoublePanel;
  final Function() onPressedPt;
  final Function() onPressedEn;

  DesktopScaffold(this.isDoublePanel, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.scaffoldPadding,
      child: Row(
        spacing: 16,
        children: [
          AppSidebar(false, onPressedPt, onPressedEn),
          Expanded(
            child: AppContent(false, isDoublePanel)
          )
        ]
      )
    );
  }
}