import 'package:flutter/material.dart';

import '../ui/scroller.dart';
import '../ui/strings.dart';
import 'mobile_scaffold.dart';
import 'desktop_scaffold.dart';

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
      home: Builder(
        builder: (context) {
          final Size screenSize = MediaQuery.of(context).size;
          return screenSize.width > 1024
            ? DesktopScaffold(
                screenSize.width > 1400,
                onPressedPt, onPressedEn
              )
            : MobileScaffold(
                screenSize.width <= screenSize.height,
                onPressedPt, onPressedEn
              );
        }
      ),
      builder: (context, homeChild) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: TextScaler.linear(1)),
          child: homeChild!
        );
      },
      debugShowCheckedModeBanner: false
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