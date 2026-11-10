import 'package:flutter/widgets.dart';

import 'theme.dart';

export 'theme.dart';

enum AppLayoutMode {
  flat, left, top, full;

  bool get isFlat => this == flat;
  bool get isLeft => this == left;
  bool get isTop => this == top;
  bool get isFull => this == full;

  bool get showSidebarBackground => isLeft || isFull;
}

class LayoutThemeModel extends ChangeNotifier {
  static final LayoutThemeModel instance = LayoutThemeModel._fac();

  AppLayoutMode _layoutMode;
  AppLayoutMode? _layoutModeToRestore;
  Brightness _themeMode;
  AppTheme _theme;

  LayoutThemeModel._(
    this._layoutMode,
    this._themeMode
  ) :
    this._theme = AppTheme.getTheme(_layoutMode, _themeMode, false);

  factory LayoutThemeModel._fac() {
    return LayoutThemeModel._(
      AppLayoutMode.top,
      WidgetsBinding.instance.platformDispatcher.platformBrightness
    );
  }

  void setLayoutMode(AppLayoutMode layoutMode) {
    if (layoutMode != _layoutMode) {
      _layoutMode = layoutMode;
      _setTheme(false);
      notifyListeners();
    }
  }

  void setThemeMode(Brightness themeMode, bool isExtendedScreen) {
    if (themeMode != _themeMode) {
      _themeMode = themeMode;
      _setTheme(isExtendedScreen);
      notifyListeners();
    }
  }

  void setLayoutModeOnScaffoldBuild(bool isExtendedScreen) {
    if (isExtendedScreen) {
      if (_layoutModeToRestore != null) {
        _layoutMode = _layoutModeToRestore!;
        _layoutModeToRestore = null;
        _setTheme(true);
      }
    }
    else if (_layoutModeToRestore == null) {
      _layoutModeToRestore = _layoutMode;
      _layoutMode = AppLayoutMode.full;
      _setTheme(false);
    }
  }

  void _setTheme(bool isExtendedScreen) {
    _theme = AppTheme.getTheme(_layoutMode, _themeMode, isExtendedScreen);
  }

  static AppLayoutMode get layoutMode => instance._layoutMode;
  static Brightness get themeMode => instance._themeMode;
  static AppTheme get theme => instance._theme;
}