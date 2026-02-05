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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppSidebar(null, onPressedPt, onPressedEn)
        ),
        Expanded(
          flex: isDoublePanel ? 3 : 2,
          child: Material(
            color: AppTheme.midLightColor,
            child: SafeArea(
              child: AppContent(isDoublePanel, false)
            )
          )
        )
      ]
    );
  }
}