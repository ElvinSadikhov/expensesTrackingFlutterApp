// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/keys.dart';
import 'package:expenses_tracking_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class LocaleState with ChangeNotifier {
  final GetStorage _localStorage = GetStorage(Keys.locale);

  Locale _getData() {
    String? data = this._localStorage.read(Keys.locale); 
    debugPrint(data);
    switch (data) {
      case "en":
        return const Locale('en'); 
      case "ru":
        return const Locale('ru'); 
      default:
        return const Locale('en');
    }  
  } 

  Future<void> _setData(Locale locale) async =>
    await this._localStorage.write(Keys.locale, locale.toString());  

  Future<void> _removeData() async {
    await this._localStorage.remove(Keys.locale);
  }
  
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return; 
    this._setData(locale);

    notifyListeners();
  }

  void clearLocale() {
    this._removeData();

    notifyListeners();
  }

  Locale? get locale => this._getData();

}
 