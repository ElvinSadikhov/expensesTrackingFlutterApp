// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/product_state.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsListView extends StatelessWidget {

  final List<Product> products;

  const ProductsListView({ Key? key, required this.products }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductState>(
      builder: (context, ProductState productState, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: this.products.isNotEmpty
            ? SizedBox( 
            height: productState.shortcutImageHeight! + productState.discountTagShift! + productState.shortcutTextHeight!, 
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: this.products.length,
              itemBuilder: (BuildContext context, int index) => 
                ProductShortcut(
                  product: this.products[index], 
                  containerSize: productState.shortcutImageHeight!, 
                  discountTagRadius: productState.discountTagRadius!, 
                  discountTagShift: productState.discountTagShift!
                )
              ), 
          )
            : const CircularProgressIndicator(),
        );
      }, 
    );  
  }
} 