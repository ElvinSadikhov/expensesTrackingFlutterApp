// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';


class BottomNavigationBarState with ChangeNotifier {
  List<BottomNavigationBarItem> navigataionItems; 
  int selectedItemIndex;

  BottomNavigationBarState({
    required this.navigataionItems,
    this.selectedItemIndex = 0, 
  });

  void updateSelectedItemIndex(int index) {
    this.selectedItemIndex = index;

    notifyListeners();
  } 
}