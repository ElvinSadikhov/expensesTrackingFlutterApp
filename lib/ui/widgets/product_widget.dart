import 'package:expenses_tracking_app/data/product.dart';
import 'package:flutter/material.dart';


class ProductWidget extends StatelessWidget {
  final Product product;
  
  const ProductWidget({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.title),
    );
  }
}