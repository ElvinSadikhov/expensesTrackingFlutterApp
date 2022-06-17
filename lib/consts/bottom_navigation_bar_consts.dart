import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/cart_screen.dart';
import 'package:expenses_tracking_app/ui/screens/history_screen.dart';
import 'package:expenses_tracking_app/ui/screens/home_screen.dart';
import 'package:expenses_tracking_app/ui/screens/profile_screen.dart';
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

}