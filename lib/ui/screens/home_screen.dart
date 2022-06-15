// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/providers/product_shortcut_state.dart'; 
import 'package:expenses_tracking_app/ui/screens/qr_scanner_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/discounted_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/favourite_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart'; 
import 'package:expenses_tracking_app/ui/widgets/latest_product_prices_block.dart'; 
import 'package:expenses_tracking_app/ui/widgets/search_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';  
import 'package:expenses_tracking_app/ui/widgets/product_search.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {  
    this.setProductShortcutSettings(context, MediaQuery.of(context).size.width);
  
    // TODO: find a way to solve it better
    return Scaffold( 
      // appBar: SearchAppBar(label: "", searchDelegate: ProductSearch(productList: [])),
      appBar: CustomAppBar(rightIcon: SearchButton(searchDelegate: ProductSearch(productList: []))),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [ 
              const DiscountedProductsBlock(),
              WidgetMethods.verticalSpace(20),
              const LatestProductPricesBlock(), 
              WidgetMethods.verticalSpace(20),
              const FavouriteProductsBlock(),
            ]
          ),
        ),
      ),
    );
  }

  // TODO: need to change this, (replace the whole productstate with som,e another class in consts for example)
  void setProductShortcutSettings(BuildContext context, double widthOfScreen) {
    Provider.of<ProductShortcutState>(context, listen: false).shortcutImageHeight = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    Provider.of<ProductShortcutState>(context, listen: false).shortcutImageWidth = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    Provider.of<ProductShortcutState>(context, listen: false).shortcutTextHeight = SizeConsts.productShortcutTextHeight;
    Provider.of<ProductShortcutState>(context, listen: false).shortcutTopPadding = widthOfScreen * SizeConsts.productShortcutTopPaddingRatio;
    Provider.of<ProductShortcutState>(context, listen: false).discountTagRadius = widthOfScreen * SizeConsts.discountTagRadiusRation;
  }
}