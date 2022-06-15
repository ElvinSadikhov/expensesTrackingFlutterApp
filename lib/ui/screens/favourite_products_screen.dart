// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/product.dart'; 
import 'package:expenses_tracking_app/consts/product_shortcut_consts.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_grid_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/product_search.dart';
import 'package:flutter/material.dart';  


class FavouriteProductsScreen extends StatelessWidget {
  final List<Product>? products;
  
  const FavouriteProductsScreen({ Key? key, this.products }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftIcon: CustomBackButton(buildContext: context),
        label: Strings.favouriteProducts,
        rightIcon: SearchButton(searchDelegate: ProductSearch(productList: this.products != null ? this.products! : [])),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: ProductsGridView( 
          products: this.products, 
          height: ProductShortcutConsts.totalWidgetHeight! ,  
          shortcutImageHeight: ProductShortcutConsts.shortcutImageHeight!,
          discountTagShift: ProductShortcutConsts.discountTagShift!,
          discountTagRadius: ProductShortcutConsts.discountTagRadius!,
        )   
      ),
    );
  }
} 