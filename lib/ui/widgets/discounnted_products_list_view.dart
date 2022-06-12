import 'package:expenses_tracking_app/data/products.dart';
import 'package:expenses_tracking_app/providers/product_state.dart';
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DiscountedProductsListView extends StatefulWidget {
  const DiscountedProductsListView({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsListView> createState() => _DiscountedProductsListViewState();
}

class _DiscountedProductsListViewState extends State<DiscountedProductsListView> {
  @override
  Widget build(BuildContext context) {  
    return Consumer<ProductState>(
      builder: (context, ProductState productState, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox( 
            height: productState.shortcutImageHeight! + productState.discountTagShift! + productState.shortcutTextHeight!, 
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: Products.products.length,
              itemBuilder: (BuildContext context, int index) => 
                ProductShortcut(
                  product: productState.productList[index], 
                  containerSize: productState.shortcutImageHeight!, 
                  discountTagRadius: productState.discountTagRadius!, 
                  discountTagShift: productState.discountTagShift!,
                )
            ), 
          ),
        );
      }, 
    );  
  }
}