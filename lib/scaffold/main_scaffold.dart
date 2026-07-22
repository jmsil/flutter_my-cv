import 'package:flutter/material.dart';

import '../ui/layout/layout_provider.dart';
import 'desktop_scaffold.dart';
import 'mobile_scaffold.dart';

class MainScaffold extends ListenableBuilder {
  MainScaffold()
    : super(
        listenable: LayoutProvider.instance,
        builder: (builderContext, builderChild) {
          final AppTheme theme = builderContext.appLayout.theme;
          final bool isDesktopScreen = builderContext.isDesktopScreen;
          return Material(
            color: theme.backgroundColor,
            child: isDesktopScreen
              ? DesktopScaffold()
              : MobileScaffold()
          );
        }
      );
}

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  bool get isSmallMobileScreen => screenWidth < 430;
  bool get isMediumMobileScreen => screenWidth >= 720;
  bool get isDesktopScreen => screenWidth >= 1260;
  bool get isLargeDesktopScreen => screenWidth >= 1640;
}