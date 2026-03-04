import 'package:flutter/material.dart';

import '../content/content.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/desktop.dart';
import 'appbar/state_provider.dart';
import 'sidebar.dart';

class DesktopScaffold extends StatelessWidget {
  final bool isDoublePanel;
  final Function() onPressedPt;
  final Function() onPressedEn;

  DesktopScaffold(this.isDoublePanel, this.onPressedPt, this.onPressedEn);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ThemedEdgeInsets.normal(),
      child: AppbarStateProvider(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              spacing: AppTheme.normalSpacingValue,
              children: [
                AppSidebar(false, onPressedPt, onPressedEn),
                Expanded(
                  child: AppbarAnimatedPadding(
                    padding: EdgeInsets.only(top: AppbarStateProvider.totalCollapsedHeight),
                    child: AppContent(false, isDoublePanel)
                  )
                )
              ]
            ),
            DesktopAppbar()
          ]
        )
      )
    );
  }
}