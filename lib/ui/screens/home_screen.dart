// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/providers/product_state.dart'; 
import 'package:expenses_tracking_app/ui/screens/qr_scanner_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/discounnted_products_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/discounted_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart'; 
import 'package:expenses_tracking_app/ui/widgets/search_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';  
import 'package:expenses_tracking_app/ui/widgets/product_search.dart';  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery.of(context).size.width;
    Provider.of<ProductState>(context, listen: false).shortcutImageHeight = widthScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    Provider.of<ProductState>(context, listen: false).shortcutImageWidth = widthScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    Provider.of<ProductState>(context, listen: false).shortcutTextHeight = SizeConsts.productShortcutTextHeight;
    Provider.of<ProductState>(context, listen: false).shortcutTopPadding = widthScreen * SizeConsts.productShortcutTopPaddingRatio;
    Provider.of<ProductState>(context, listen: false).discountTagRadius = widthScreen * SizeConsts.discountTagRadiusRation;
  
    return Scaffold( 
      appBar: SearchAppBar(label: "", searchDelegate: ProductSearch(productList: [])),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const QrScannerScreen())
          );
        },
        child: const Icon(Icons.qr_code_scanner_outlined),
        backgroundColor: ColorConsts.navBarSelectedItemColor, 
      ),  
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: Column(
          children: [
            const ProductBlock(blockLabel: BlockLabel(title: Strings.discountedProducts,), child: DiscountedProductsListView())
            // const DiscountedProductsBlock(),
            // WidgetMethods.verticalSpace(20),
            // const LatestProductPricesBlock(),
          ]
        ),
      ),
    );
  }
}