import 'package:expenses_tracking_app/consts/keys.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MainConfiguration {
  
  MainConfiguration._();

  static Future<void> configure() async {
    await GetStorage.init(Keys.theme);  
    await GetStorage.init(Keys.locale); 

    WidgetsFlutterBinding.ensureInitialized();
  }
}