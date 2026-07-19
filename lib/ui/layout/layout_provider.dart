import 'package:flutter/widgets.dart';

import '../../scaffold/main_scaffold.dart';
import '../theme/flat_theme.dart';
import '../theme/left_theme.dart';
import '../theme/theme.dart';

enum Layout { flat, left, full }

class LayoutProvider extends ChangeNotifier {
  static final AppTheme _appTheme = AppTheme();
  static final LayoutProvider instance = LayoutProvider._();

  Layout _layout = Layout.flat;
  AppTheme _theme = FlatTheme();

  LayoutProvider._();

  void setLayout(Layout layout) {
    if (layout != _layout) {
      _layout = layout;

      switch (layout) {
        case Layout.flat:
          _theme = FlatTheme();
          break;
        case Layout.left:
          _theme = LeftTheme();
          break;
        case Layout.full:
          _theme = _appTheme;
          break;
      }

      notifyListeners();
    }
  }
}

extension BuildContextExtension on BuildContext {
  Layout get providerLayout {
    return this.isDesktopScreen ? LayoutProvider.instance._layout : Layout.full;
  }

  AppTheme get providerTheme {
    return this.isDesktopScreen ? LayoutProvider.instance._theme : LayoutProvider._appTheme;
  }
}