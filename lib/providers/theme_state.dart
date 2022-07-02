// ignore_for_file: unnecessary_this, unrelated_type_equality_checks

import 'package:expenses_tracking_app/consts/keys.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeState with ChangeNotifier{ 
  final GetStorage _localStorage = GetStorage(Keys.theme);

  ThemeMode _getData() {
    String? data = _localStorage.read(Keys.theme); 
    switch (data) {
      case "ThemeMode.dark":
        return ThemeMode.dark; 
      case "ThemeMode.light":
        return ThemeMode.light; 
      default:
        return ThemeMode.light;
    } 
  } 

  Future<void> _setData(ThemeMode themeMode) async =>
    await _localStorage.write(Keys.theme, themeMode.toString()); 
   

  void toggleTheme() {
    _setData(this.isDark() ? ThemeMode.light : ThemeMode.dark); 

    notifyListeners();
  } 

  bool isDark() => this._getData() == ThemeMode.dark; 

  ThemeMode get themeMode => this._getData();

}