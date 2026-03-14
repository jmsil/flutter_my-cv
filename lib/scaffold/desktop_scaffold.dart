import 'package:flutter/material.dart';

import '../content/content.dart';
import '../ui/theme.dart';
import 'appbar/animated_padding.dart';
import 'appbar/desktop.dart';
import 'appbar/state_provider.dart';
import 'sidebar.dart';

class DesktopScaffold extends Padding {
  DesktopScaffold(Function() onPressedPt, Function() onPressedEn)
    : super(
        padding: const ThemedEdgeInsets.normal(),
        child: AppbarStateProvider(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                spacing: AppTheme.normalSpacingValue,
                children: [
                  AppSidebar(onPressedPt, onPressedEn),
                  Expanded(
                    child: AppbarAnimatedPadding(
                      padding: EdgeInsets.only(top: AppbarStateProvider.totalCollapsedHeight),
                      child: AppContent()
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