import 'package:flutter/widgets.dart';

import '../../scaffold/device.dart';
import 'layout.dart';

export 'layout.dart';
export 'theme.dart';

class LayoutModel extends ChangeNotifier {
  static final LayoutModel instance = LayoutModel._();

  AppLayout _layout = AppLayout.top;

  LayoutModel._();

  void setLayout(AppLayout layout) {
    if (layout != _layout) {
      _layout = layout;
      notifyListeners();
    }
  }
}

extension BuildContextExtension on BuildContext {
  AppLayout get appLayout {
    return this.isExtendedScreen ? LayoutModel.instance._layout : AppLayout.full;
  }
}