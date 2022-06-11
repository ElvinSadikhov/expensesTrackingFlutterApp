import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart'; 
import 'package:expenses_tracking_app/ui/screens/qr_scanner_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/search_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';  
import 'package:expenses_tracking_app/ui/widgets/product_search.dart'; 
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold( 
      appBar: SearchAppBar(label: "", searchDelegate: ProductSearch(productList: [])),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const QrScannerScreen())
          );
        },
        child: const Icon(Icons.qr_code_scanner_outlined),
        backgroundColor: ColorConsts.navBarSelectedItemColor, 
      ),  
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: Column(
          children: const [
             
          ]
        ),
      ),
    );
  }
}