// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class FavouriteProductsListView extends StatefulWidget {
  const FavouriteProductsListView({ Key? key }) : super(key: key);

  @override
  State<FavouriteProductsListView> createState() => _FavouriteProductsListViewState();
}

class _FavouriteProductsListViewState extends State<FavouriteProductsListView> {   

  // TODO: write a provider for favourite products ЖЕЛАТЕЛЬНО using database
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Consumer<FavouriteProducts>(
    //   builder: (context, FavouriteProducts favouriteProducts, _) {
    //     return ProductsListView(products: favouriteProducts.products);
    //   }, 
    // );
  }
}