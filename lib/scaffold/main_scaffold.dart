import 'package:flutter/material.dart';

import '../ui/scroller.dart';
import '../ui/strings.dart';
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
      builder: buildMediaQuery,
      debugShowCheckedModeBanner: false
    );
  }

  Widget buildScaffold(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1024
      ? DesktopScaffold(
          screenWidth > 1540,
          onPressedPt, onPressedEn
        )
      : MobileScaffold(onPressedPt, onPressedEn);
  }

  Widget buildMediaQuery(BuildContext context, Widget? homeChild) {
    final MediaQueryData data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaler: TextScaler.linear(1)),
      child: homeChild!
    );
  }

  void onPressedPt() {
    if (AppStrings.setLanguage(0))
      setState(() {});
  }

  void onPressedEn() {
    if (AppStrings.setLanguage(1))
      setState(() {});
  }
}