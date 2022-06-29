// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/ui/screens/main_screen.dart';
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

  void changeScreenByIndex({required BuildContext context, required int index}) {
    this.updateSelectedItemIndex(index: index);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen())); 
  } 
 

}