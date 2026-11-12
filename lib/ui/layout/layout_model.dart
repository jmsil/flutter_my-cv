import 'package:flutter/widgets.dart';

import 'theme.dart';

export 'theme.dart';

enum LayoutMode {
  flat, left, top, full;

  bool get isFlat => this == flat;
  bool get isLeft => this == left;
  bool get isTop => this == top;
  bool get isFull => this == full;

  bool get showSidebarBackground => isLeft || isFull;
}

class LayoutModel extends ChangeNotifier {
  static const double sidebarWidth = 480;
  static final LayoutModel instance = LayoutModel._(
    LayoutMode.top,
    WidgetsBinding.instance.platformDispatcher.platformBrightness
  );

  LayoutMode _layoutMode;
  LayoutMode? _layoutModeToRestore;
  Brightness _themeMode;
  AppTheme _theme;

  LayoutModel._(
    this._layoutMode,
    this._themeMode
  ) :
    this._theme = AppTheme(_layoutMode, _themeMode);

  void setLayoutMode(LayoutMode layoutMode) {
    if (layoutMode != _layoutMode) {
      _layoutMode = layoutMode;
      _setTheme();
      notifyListeners();
    }
  }

  void setThemeMode(Brightness themeMode) {
    if (themeMode != _themeMode) {
      _themeMode = themeMode;
      _setTheme();
      notifyListeners();
    }
  }

  void setLayoutModeOnScaffoldBuild(bool isExtendedScreen) {
    if (isExtendedScreen) {
      if (_layoutModeToRestore != null) {
        _layoutMode = _layoutModeToRestore!;
        _layoutModeToRestore = null;
        _setTheme();
      }
    }
    else if (_layoutMode != LayoutMode.full) {
      _layoutModeToRestore = _layoutMode;
      _layoutMode = LayoutMode.full;
      _setTheme();
    }
  }

  void _setTheme() {
    _theme = AppTheme(_layoutMode, _themeMode);
  }

  static LayoutMode get layoutMode => instance._layoutMode;
  static Brightness get themeMode => instance._themeMode;
  static AppTheme get theme => instance._theme;
}