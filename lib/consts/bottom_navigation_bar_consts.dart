import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/discounted_products_screen.dart';
import 'package:expenses_tracking_app/ui/screens/favourite_products_screen.dart';
import 'package:expenses_tracking_app/ui/screens/helpers/cart_screen.dart';
import 'package:expenses_tracking_app/ui/screens/helpers/history_screen.dart';
import 'package:expenses_tracking_app/ui/screens/helpers/home_screen.dart';
import 'package:expenses_tracking_app/ui/screens/helpers/profile_screen.dart';
import 'package:expenses_tracking_app/ui/screens/latest_product_prices_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarConsts {

  BottomNavigationBarConsts._(); 

  static final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: Strings.home),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_rounded), label: Strings.cart),
    const BottomNavigationBarItem(icon: Icon(Icons.history), label: Strings.history),
    const BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: Strings.profile),
  ]; 

  static final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ]; 

  static final List<Widget> secondaryScreens = [
    const DiscountedProductsScreen(),
    const LatestProductPricesScreen(),
    const FavouriteProductsScreen(), 
  ]; 

}