import 'package:expenses_tracking_app/app.dart';
import 'package:expenses_tracking_app/consts/bottom_navigation_bar_items.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart'; 
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/providers/product_shortcut_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarState(navigataionItems: BottomNavigationBarItems.navigationItems)),
        ChangeNotifierProvider(create: (_) => ProductShortcutState()),
        ChangeNotifierProvider(create: (_) => FavouriteProductsState()),  

      ],
      child: const MyApp(),
    ), 
  );
}

