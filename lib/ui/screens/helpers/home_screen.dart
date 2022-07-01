// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_this
 
import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart'; 
import 'package:expenses_tracking_app/ui/widgets/discounted_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/favourite_products_block.dart';  
import 'package:expenses_tracking_app/ui/widgets/latest_product_prices_block.dart';  
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';  
import 'package:flutter/material.dart'; 
 

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Padding(
      padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [ 
            WidgetMethods.verticalSpace(10),
            const DiscountedProductsBlock(),
            WidgetMethods.verticalSpace(20),
            const LatestProductPricesBlock(), 
            WidgetMethods.verticalSpace(20),
            const FavouriteProductsBlock(),
          ]
        ),
      ),
    );
  } 
}  