import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/providers/product_shortcut_state.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_grid_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/qr_scanner_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/search_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 


class FavouriteProductsScreen extends StatefulWidget {
  const FavouriteProductsScreen({ Key? key }) : super(key: key);

  @override
  State<FavouriteProductsScreen> createState() => _FavouriteProductsScreenState();
}

class _FavouriteProductsScreenState extends State<FavouriteProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leftIcon: CustomBackButton(buildContext: context),
        label: Strings.favouriteProducts,
        rightIcon: SearchButton(searchDelegate: ProductSearch(productList: [])),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const QRScannerButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, bottom: 20),
        child: Consumer<FavouriteProductsState>(  
          builder: (context, FavouriteProductsState favouriteProductsState, _) {
            return FutureBuilder<List<Product>>(
              future: favouriteProductsState.favourites,
              builder: (context, snapshot) {
                return Container();
                // TODO: SOLVE IT AFTER CHANGING PRODUCT SHORTCUT PROVIDER
                // return snapshot.hasData 
                // ? ProductsGridView(
                //   numberOfColumns: 2,
                //   products: snapshot.data!, 
                //   height: Provider.of<ProductShortcutState>(context, listen: false).shortcutImageHeight! , // productShortcutState.shortcutImageHeight! + productShortcutState.discountTagShift! + 50,
                //   shortcutImageHeight: productShortcutState.shortcutImageHeight!,
                //   discountTagShift: productShortcutState.discountTagShift!,
                //   discountTagRadius: productShortcutState.discountTagRadius!,
                // ) 
                  // : const Center(child: CircularProgressIndicator()); 
              } 
            ); 
          } 
        ),
      ),
    );
  }
}