import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/discounted_products_screen.dart';
import 'package:expenses_tracking_app/ui/screens/favourite_products_screen.dart'; 
import 'package:expenses_tracking_app/ui/screens/latest_product_prices_screen.dart';
import 'package:expenses_tracking_app/ui/screens/pages/cart_page.dart';
import 'package:expenses_tracking_app/ui/screens/pages/history_page.dart';
import 'package:expenses_tracking_app/ui/screens/pages/home_page.dart';
import 'package:expenses_tracking_app/ui/screens/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationBarConsts {

  BottomNavigationBarConsts._(); 

  static List<BottomNavigationBarItem> getNavigationItems({required BuildContext context}) => [
    BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppLocalizations.of(context)!.home),
    BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart_checkout_rounded), label: AppLocalizations.of(context)!.cart),
    BottomNavigationBarItem(icon: const Icon(Icons.history), label: AppLocalizations.of(context)!.history),
    BottomNavigationBarItem(icon: const Icon(Icons.person), label: AppLocalizations.of(context)!.profile),
  ]; 

  static final List<Widget> screens = [
    const HomePage(),
    const CartPage(),
    const HistoryPage(),
    const ProfilePage(),
  ]; 

  static final List<Widget> secondaryScreens = [
    const DiscountedProductsScreen(),
    const LatestProductPricesScreen(),
    const FavouriteProductsScreen(), 
  ]; 

}