import 'package:flutter/material.dart';

class ThemeState {

  final ThemeMode _themeMode = ThemeMode.dark;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  Brightness getSystemTheme({required BuildContext context}) {
    return MediaQuery.of(context).platformBrightness;
  }


}