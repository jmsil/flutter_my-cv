import 'package:flutter/material.dart';

import '../ui/theme.dart';
import 'desktop_scaffold.dart';
import 'mobile_scaffold.dart';

class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.mainScaffoldBackgroundColor,
      child: context.isDesktopScreen
        ? DesktopScaffold()
        : MobileScaffold()
    );
  }
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