// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/providers/bottom_navigation_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({ Key? key }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> { 

  @override
  Widget build(BuildContext context) { 
    return Consumer<BottomNavigationBarState>(
      builder: (context, BottomNavigationBarState bottomNavigationBarState, _) {
        return BottomNavigationBar(
          // TODO: MAKE THIS LIST ALSO A VARIABLE OF STATE
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: Strings.home),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout_rounded), label: Strings.cart),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: Strings.history),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: Strings.profile),
          ],
          selectedItemColor: ColorConsts.navBarSelectedItemColor,
          currentIndex: bottomNavigationBarState.selectedItemIndex,
          onTap: (index) {
            bottomNavigationBarState.updateSelectedItemIndex(index);
          },
          type: BottomNavigationBarType.fixed,
        );
      }, 
    );
  } 
}
 