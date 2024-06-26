import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_view_model.dart';

final themeViewModel = ChangeNotifierProvider((ref) => ThemeConfig());

class ThemeConfig extends BaseViewModel {
  // ThemeConfig._();
  //
  // static final _instance = ThemeConfig._();
  // static ThemeConfig get instance => _instance;

  ThemeMode _themeMode = ThemeMode.dark;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _setStatusBar();
    notifyListeners();
  }

  void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness:
          _themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
    ));
  }

  ThemeMode get themeMode => _themeMode;
}
