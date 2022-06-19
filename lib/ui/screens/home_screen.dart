// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_this
 
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/consts/product_shortcut_consts.dart';  
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/explore_service.dart.dart';  
import 'package:expenses_tracking_app/ui/widgets/discounted_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/favourite_products_block.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart'; 
import 'package:expenses_tracking_app/ui/widgets/latest_product_prices_block.dart';  
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';  
import 'package:expenses_tracking_app/ui/widgets/helpers/product_search.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart'; 
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';  
import 'package:flutter/material.dart'; 


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExploreService exploreService = ExploreService();
  ProductResponse? productResponse; 

  @override
  void initState() { 
    super.initState();

    fetchData();
  }
  
  Future<void> fetchData() async {
    this.productResponse = await this.exploreService.getAllProducts(); 

    if(this.mounted) {
      setState(() { 

      });
    } 
  }

  @override
  Widget build(BuildContext context) {  

    this._initProductShortcutConsts(context, MediaQuery.of(context).size.width); 
    
    return Scaffold(  
      appBar: CustomAppBar(rightIcon: SearchButton(searchDelegate: ProductSearch(productList: this.productResponse != null ? this.productResponse!.products : []))), // appBar: SearchAppBar(label: "", searchDelegate: ProductSearch(productList: [])),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(), 
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
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

  // TODO: bu const classi ele pramoy icinde yazim eger ancaq orda lazimdisa

  void _initProductShortcutConsts(BuildContext context, double widthOfScreen) {
    ProductShortcutConsts.shortcutImageHeight = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    ProductShortcutConsts.shortcutImageWidth = widthOfScreen * SizeConsts.productShortcutImageHeightWidthRatio;
    ProductShortcutConsts.shortcutTextHeight = SizeConsts.productShortcutTextHeight;  
    ProductShortcutConsts.discountTagShift = widthOfScreen * SizeConsts.productShortcutTopPaddingRatio;
    ProductShortcutConsts.discountTagRadius = widthOfScreen * SizeConsts.discountTagRadiusRation;
  }
}
 