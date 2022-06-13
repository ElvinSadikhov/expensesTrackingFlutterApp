import 'package:expenses_tracking_app/app.dart';
import 'package:expenses_tracking_app/consts/bottom_navigation_bar_items.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/providers/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarState(navigataionItems: BottomNavigationBarItems.navigationItems)),
        ChangeNotifierProvider(create: (_) => ProductState()),
        ChangeNotifierProvider(create: (_) => FavouriteProductsState()), // TODO: change something here in order let it work correctly
        
      ],
      child: const MyApp(),
    ), 
  );
}

