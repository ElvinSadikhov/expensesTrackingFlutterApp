import 'package:expenses_tracking_app/app.dart';
import 'package:expenses_tracking_app/consts/bottom_navigation_bar_consts.dart';
import 'package:expenses_tracking_app/consts/keys.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:expenses_tracking_app/providers/cart_state.dart'; 
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/providers/locale_state.dart';
import 'package:expenses_tracking_app/providers/theme_state.dart'; 
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await GetStorage.init(Keys.theme);  
  await GetStorage.init(Keys.locale); 

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarState(  
          screens: BottomNavigationBarConsts.screens)
        ), 
        ChangeNotifierProvider(create: (_) => FavouriteProductsState()),  
        ChangeNotifierProvider(create: (_) => CartState()), 
        ChangeNotifierProvider(create: (_) => ThemeState()), 
        ChangeNotifierProvider(create: (_) => LocaleState()),  
      ],
      child: const MyApp(),
    ), 
  );
}

