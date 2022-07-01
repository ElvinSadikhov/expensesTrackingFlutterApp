// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier{

  // TODO: save it get storage
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = this.isDark() ? ThemeMode.light : ThemeMode.dark; 

    notifyListeners();
  } 

  bool isDark() => _themeMode == ThemeMode.dark; 

}