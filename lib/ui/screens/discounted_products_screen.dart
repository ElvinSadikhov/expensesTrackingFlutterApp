// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/providers/product_shortcut_state.dart';
import 'package:expenses_tracking_app/services/discounted_products_service.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_grid_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_search.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DiscountedProductsScreen extends StatefulWidget {
  const DiscountedProductsScreen({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsScreen> createState() => _DiscountedProductsScreenState();
}

class _DiscountedProductsScreenState extends State<DiscountedProductsScreen> {
  DiscountedProductsService discountedProductsService = DiscountedProductsService();
  ProductResponse? productResponse;  

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  } 

  Future<void> fetchData() async {
    productResponse = await discountedProductsService.getProducts();
    
    if(this.mounted) {
      setState(() { 

      });
    } 
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: CustomAppBar(
        leftIcon: CustomBackButton(buildContext: context), 
        label: Strings.discountedProducts, 
        rightIcon: SearchButton(searchDelegate: ProductSearch(productList: []))
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, bottom: 20),
        child: Consumer<ProductShortcutState>(  
          builder: (context, ProductShortcutState productShortcutState, _) {
            return this.productResponse != null 
              ? ProductsGridView(
                numberOfColumns: 2,
                products: this.productResponse!.products, 
                height: productShortcutState.shortcutImageHeight! + productShortcutState.discountTagShift! + 50,
                shortcutImageHeight: productShortcutState.shortcutImageHeight!,
                discountTagShift: productShortcutState.discountTagShift!,
                discountTagRadius: productShortcutState.discountTagRadius!,
              ) 
                : const Center(child: CircularProgressIndicator());
          } 
        ),
      ),
    );
  }
} 