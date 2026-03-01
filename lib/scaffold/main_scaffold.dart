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
      builder: builder,
      debugShowCheckedModeBanner: false
    );
  }

  Widget buildScaffold(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: AppTheme.highLightColor,
      child: screenWidth >= 1280
        ? DesktopScaffold(screenWidth >= 1760, onPressedPt, onPressedEn)
        : MobileScaffold(onPressedPt, onPressedEn)
    );
  }

  Widget builder(BuildContext context, Widget? homeChild) {
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaler: TextScaler.linear(1)),
      child: homeChild!
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