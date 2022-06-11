import 'package:expenses_tracking_app/data/strings.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarItems {

  BottomNavigationBarItems._();

  static final List<BottomNavigationBarItem> _navigationItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: Strings.home),
      const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_rounded), label: Strings.cart),
      const BottomNavigationBarItem(icon: Icon(Icons.history), label: Strings.history),
      const BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: Strings.profile),
    ];

  static List<BottomNavigationBarItem> get navigationItems => _navigationItems;

}