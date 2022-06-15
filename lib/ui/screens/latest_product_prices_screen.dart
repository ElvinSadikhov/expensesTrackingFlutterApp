// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/consts/product_shortcut_consts.dart';
import 'package:expenses_tracking_app/services/explore_service.dart.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_grid_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_search.dart';
import 'package:flutter/material.dart'; 


class LatestProductPricesScreen extends StatefulWidget {
  const LatestProductPricesScreen({ Key? key }) : super(key: key);

  @override
  State<LatestProductPricesScreen> createState() => _LatestProductPricesScreenState();
}

class _LatestProductPricesScreenState extends State<LatestProductPricesScreen> {
  ExploreService exploreService = ExploreService();
  ProductResponse? productResponse; 

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  } 

  Future<void> fetchData() async {
    productResponse = await exploreService.getProducts();
    
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
        label: Strings.latestProductPrices, 
        rightIcon: SearchButton(searchDelegate: ProductSearch(productList: []))
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, bottom: 20),
        child: this.productResponse != null 
          ? ProductsGridView(
            numberOfColumns: 2,
            products: this.productResponse!.products, 
            height: ProductShortcutConsts.totalWidgetHeight!,
            shortcutImageHeight: ProductShortcutConsts.shortcutImageHeight!,
            discountTagShift: ProductShortcutConsts.discountTagShift!,
            discountTagRadius: ProductShortcutConsts.discountTagRadius!,
          ) 
          : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}