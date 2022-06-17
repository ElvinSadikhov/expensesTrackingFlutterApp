// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/helpers/favourites_data_helper.dart'; 
import 'package:flutter/cupertino.dart'; 


class FavouriteProductsState with ChangeNotifier {
  final dbHelper = FavouritesDataHelper.instanse;

  final Future<List<Product>> _favouriteProducts = _getFavouriteProducts();     

  static Future<List<Product>> _getFavouriteProducts() async {
    return await FavouritesDataHelper.instanse.read();
  }

  Future<bool> isFavourite(Product product) async {
    return await this._favouriteProducts.then((value) { 
      return value.contains(product); 
    });
  }

  Future<void> changeState(Product product) async {
    if(await this.isFavourite(product)) {
      dbHelper.remove(product); 
      await _favouriteProducts.then((value) => value.remove(product));
    } else {
      dbHelper.add(product);
      await _favouriteProducts.then((value) => value.add(product));
    }  
    
    notifyListeners();
  } 

  Future<List<Product>> get favourites => _favouriteProducts;

} 