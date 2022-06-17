// ignore_for_file: unnecessary_this
 
import 'package:flutter/material.dart';


class BottomNavigationBarState with ChangeNotifier {
  List<BottomNavigationBarItem> navigataionItems; 
  List<Widget> screens;
  int selectedItemIndex; 

  BottomNavigationBarState({
    required this.navigataionItems,
    required this.screens,
    this.selectedItemIndex = 0,  
  });

  void updateSelectedItemIndex({required int index}) {
    this.selectedItemIndex = index; 

    notifyListeners();
  } 

  void changeScreen({required BuildContext context, required int index}) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => screens[index])
    );
  }
}