import 'package:flutter/material.dart';

import '../ui/layout/layout_provider.dart';
import '../ui/layout/theme.dart';
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
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  bool get isSmallMobileScreen {
    return MediaQuery.of(this).size.width < 430;
  }

  bool get isDesktopScreen {
    return MediaQuery.of(this).size.width >= 1260;
  }

  bool get isLargeDesktopScreen {
    return MediaQuery.of(this).size.width >= 1640;
  }
}