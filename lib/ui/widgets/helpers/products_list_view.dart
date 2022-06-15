// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/consts/product_shortcut_consts.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart';
import 'package:flutter/material.dart'; 

class ProductsListView extends StatelessWidget { 
  final List<Product>? products;

  const ProductsListView({ Key? key, required this.products }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: this.products != null
      ? this.products!.isNotEmpty
        ? SizedBox( 
        height: ProductShortcutConsts.totalWidgetHeight!,  
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: this.products!.length,
          itemBuilder: (BuildContext context, int index) => 
            ProductShortcut(
              product: this.products![index], 
              containerSize: ProductShortcutConsts.shortcutImageHeight!, 
              discountTagRadius: ProductShortcutConsts.discountTagRadius!, 
              discountTagShift: ProductShortcutConsts.discountTagShift!
            )
          ), 
        )
        : Text("Not found") 
      : const CircularProgressIndicator()
    );  
  }
} 