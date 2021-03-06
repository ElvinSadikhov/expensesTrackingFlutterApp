// ignore_for_file: unnecessary_this
  
import 'dart:collection';

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/utils/helpers/product_shortcut_size_properties.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_grid_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart'; 
import 'package:flutter/material.dart';

 
class ProductSearch extends SearchDelegate<ProductShortcut?> { 
  final List<Product> productList;
   
  ProductSearch({required this.productList}); 

  @override
  List<Widget>? buildActions(BuildContext context) { 
    return [
      IconButton(
        onPressed: () {
          query = "";
        }, 
        icon: const Icon(Icons.clear, size: SizeConsts.kDefaultAppBarButtonSize)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) { 
    return IconButton(
      onPressed: () {
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back, size: SizeConsts.kDefaultAppBarButtonSize)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Product> suggestions = this.findResults();  

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: ProductsGridView(
          products: suggestions,
          height: ProductShortcutSizeProperties.totalWidgetHeight! ,  
          shortcutImageHeight: ProductShortcutSizeProperties.shortcutImageHeight!,
          discountTagShift: ProductShortcutSizeProperties.discountTagShift!,
          discountTagRadius: ProductShortcutSizeProperties.discountTagRadius!,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {  
    final List<Product> suggestions = this.findSuggestions();   
 
    return ListView.builder( 
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.horizontalPadding, vertical: 5),
          child: GestureDetector(
            child: Container( 
              child: Card( 
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: ColorConsts.black.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    suggestions[index].title, 
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
                  ),
                ), 
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 5.0,
                    offset: const Offset(0, 2),
                    spreadRadius: 0.00001,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
            ), /////
            onTap: () {
              query = suggestions[index].title;
            },
          ),
        );
      }
    );
  }   

  List<Product> findSuggestions() {
    List<Product> uniqueProducts = [];
    List<String> uniqueProductsTitles = [];

    for (Product product in this.productList) {
      if(product.title.toLowerCase().contains(query.toLowerCase()) && !uniqueProductsTitles.contains(product.title)) {
        uniqueProducts.add(product);
        uniqueProductsTitles.add(product.title);
      }
    }  

    return uniqueProducts;
 
  }

  List<Product> findResults() => 
    this.productList.where((product) => product.title.toLowerCase().contains(query.toLowerCase())).toList();  
  

}