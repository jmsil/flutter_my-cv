import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

class AppDevice {
  static bool isMobileDevice() {
    String userAgent = window.navigator.userAgent.toLowerCase();
    return
      userAgent.contains('iphone') ||
      userAgent.contains('ipad') ||
      userAgent.contains('android');
  }
}

extension BuildContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  bool get isExtendedScreen => screenSize.width >= 1260;
}