// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/utils/helpers/product_shortcut_size_properties.dart'; 
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
        height: ProductShortcutSizeProperties.totalWidgetHeight!,  
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: this.products!.length,
          itemBuilder: (BuildContext context, int index) => 
            ProductShortcut(
              product: this.products![index],  
            )
          ), 
        )
        : Text("Not found") // TODO: for test 
      : const CircularProgressIndicator()
    );  
  }
} 