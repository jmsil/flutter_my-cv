import 'package:flutter/material.dart';

import '../ui/layout/layout_provider.dart';
import 'desktop_scaffold.dart';
import 'mobile_scaffold.dart';

class MainScaffold extends ListenableBuilder {
  MainScaffold()
    : super(
        listenable: LayoutProvider.instance,
        builder: (builderContext, builderChild) {
          return Material(
            color: LayoutProvider.theme.backgroundColor,
            child: builderContext.isDesktopScreen
              ? DesktopScaffold()
              : MobileScaffold()
          );
        }
      );
}

extension MainScaffoldScreenExtension on BuildContext {
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