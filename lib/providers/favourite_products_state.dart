// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/helpers/favourites_data_helper.dart'; 
import 'package:flutter/cupertino.dart'; 


class FavouriteProductsState with ChangeNotifier {
  final dbHelper = FavouritesDataHelper.instanse; 

  static Future<List<Product>> _getFavouriteProducts() async {
    return await FavouritesDataHelper.instanse.read();
  }

  Future<bool> isFavourite(Product product) async {
    List<Product> favourites = await _getFavouriteProducts();

    return favourites.contains(product);  
  }

  Future<void> changeState(Product product) async {
    List<Product> favourites = await _getFavouriteProducts();

    if(await this.isFavourite(product)) {
      favourites.remove(product);
      dbHelper.remove(product);  
    } else { 
      favourites.add(product);
      dbHelper.add(product);
    }  
    
    notifyListeners();
  } 

  Future<List<Product>> get favourites => _getFavouriteProducts();

} 