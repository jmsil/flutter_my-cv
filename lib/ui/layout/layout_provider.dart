import 'package:flutter/widgets.dart';

import '../../scaffold/main_scaffold.dart';
import 'layout.dart';

export 'layout.dart';
export 'theme.dart';

class LayoutProvider extends ChangeNotifier {
  static final LayoutProvider instance = LayoutProvider._();

  AppLayout _layout = AppLayout.top;

  LayoutProvider._();

  void setLayout(AppLayout layout) {
    if (layout != _layout) {
      _layout = layout;
      notifyListeners();
    }
  }
}

extension BuildContextExtension on BuildContext {
  AppLayout get appLayout {
    return this.isDesktopScreen ? LayoutProvider.instance._layout : AppLayout.full;
  }
}