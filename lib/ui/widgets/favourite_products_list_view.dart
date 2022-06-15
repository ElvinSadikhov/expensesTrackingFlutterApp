// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class FavouriteProductsListView extends StatefulWidget {
  const FavouriteProductsListView({ Key? key }) : super(key: key);

  @override
  State<FavouriteProductsListView> createState() => _FavouriteProductsListViewState();
}

class _FavouriteProductsListViewState extends State<FavouriteProductsListView> {   
 
  @override
  Widget build(BuildContext context) { 
    return Consumer<FavouriteProductsState>(
      builder: (context, FavouriteProductsState favouriteProductsState, _) {
        return FutureBuilder<List<Product>>(
          future: favouriteProductsState.favourites,
          builder: ((context, snapshot) {
            return snapshot.hasData
              ? ProductsListView(products: snapshot.data!)
                : Container();
          }), 
        );
      }, 
    );
  }
}