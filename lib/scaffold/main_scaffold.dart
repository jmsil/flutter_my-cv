import 'package:flutter/material.dart';

import '../ui/scroller.dart';
import '../ui/strings.dart';
import '../ui/theme.dart';
import 'desktop_scaffold.dart';
import 'mobile_scaffold.dart';

class MainScaffold extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      scrollBehavior: AppScrollBehavior(),
      home: Builder(builder: buildScaffold),
      debugShowCheckedModeBanner: false
    );
  }

  Widget buildScaffold(BuildContext context) {
    return Material(
      color: AppTheme.highLightColor,
      child: context.isDesktopScreen
        ? DesktopScaffold(onPressedPt, onPressedEn)
        : MobileScaffold(onPressedPt, onPressedEn)
    );
  }

  void onPressedPt() {
    if (AppStrings.setLanguage('pt'))
      setState(() {});
  }

  void onPressedEn() {
    if (AppStrings.setLanguage('en'))
      setState(() {});
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