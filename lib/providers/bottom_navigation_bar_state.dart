// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/bottom_navigation_bar_items.dart';
import 'package:expenses_tracking_app/data/strings.dart'; 
import 'package:flutter/material.dart';

class BottomNavigationBarState with ChangeNotifier {
  // static final List<BottomNavigationBarItem> _navigataionItems = BottomNavigationBarItems.navigationItems;

   

  int _selectedItemIndex = 0;

  void updateSelectedItemIndex(int index) {
    this._selectedItemIndex = index;

    notifyListeners();
  }

  int get selectedItemIndex => _selectedItemIndex;
  // List<BottomNavigationBarItem>
}