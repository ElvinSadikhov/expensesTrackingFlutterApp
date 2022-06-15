// ignore_for_file: prefer_const_constructors

import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/discounted_products_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/discounnted_products_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart'; 


class DiscountedProductsBlock extends StatelessWidget {
  const DiscountedProductsBlock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductBlock(
      blockLabel: BlockLabel(
        title: Strings.discountedProducts, 
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => DiscountedProductsScreen())
          );
        } 
      ), 
      productListView: DiscountedProductsListView()
    );
  }
} 