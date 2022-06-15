// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart';
import 'package:expenses_tracking_app/utils/helpers/grid_delegate_helper.dart';
import 'package:flutter/material.dart';


class ProductsGridView extends StatelessWidget {
  final double height;
  final List<Product> products;
  final int numberOfColumns;
  final double shortcutImageHeight;
  final double discountTagRadius;
  final double discountTagShift;

  const ProductsGridView({ Key? key, 
    required this.height, 
    required this.products,  
    required this.shortcutImageHeight, 
    required this.discountTagRadius, 
    required this.discountTagShift, 
    this.numberOfColumns = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: this.numberOfColumns,
        crossAxisSpacing: 0,
        mainAxisSpacing: 20,
        height: this.height,  
      ), 
      itemCount: this.products.length,
      itemBuilder: (context, index) {
        return ProductShortcut(
          product: this.products[index], 
          containerSize: this.shortcutImageHeight, 
          discountTagRadius: this.discountTagRadius, 
          discountTagShift: this.discountTagShift
        );
      }
    );
  }
}