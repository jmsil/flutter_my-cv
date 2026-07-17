import 'package:flutter/foundation.dart';

import '../theme/flat_light_theme.dart';
import '../theme/left_pane_theme.dart';
import '../theme/theme.dart';
import '../theme/top_left_panes_theme.dart';

enum Layout { flatLight, leftPane, topLeftPanes }

class LayoutProvider extends ChangeNotifier {
  static final LayoutProvider instance = LayoutProvider._();

  Layout _layout = Layout.topLeftPanes;
  AppTheme _theme = TopLeftPanesTheme();

  LayoutProvider._();

  void setLayout(Layout layout) {
    if (layout == _layout)
      return;

    _layout = layout;

    switch (layout) {
      case Layout.flatLight:
        _theme = FlatLightTheme();
        break;
      case Layout.leftPane:
        _theme = LeftPaneTheme();
        break;
      case Layout.topLeftPanes:
        _theme = TopLeftPanesTheme();
        break;
    }

    notifyListeners();
  }

  static Layout get layout => instance._layout;
  static AppTheme get theme => instance._theme;
}