import 'package:flutter/foundation.dart';

import '../theme/flat_theme.dart';
import '../theme/full_theme.dart';
import '../theme/left_theme.dart';
import '../theme/theme.dart';

enum Layout { flat, left, full }

class LayoutProvider extends ChangeNotifier {
  static final LayoutProvider instance = LayoutProvider._();

  Layout _layout = Layout.full;
  AppTheme _theme = FullTheme();

  LayoutProvider._();

  void setLayout(Layout layout) {
    if (layout == _layout)
      return;

    _layout = layout;

    switch (layout) {
      case Layout.flat:
        _theme = FlatTheme();
        break;
      case Layout.left:
        _theme = LeftTheme();
        break;
      case Layout.full:
        _theme = FullTheme();
        break;
    }

    notifyListeners();
  }

  static Layout get layout => instance._layout;
  static AppTheme get theme => instance._theme;
}