// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/helpers/database_helper.dart'; 
import 'package:flutter/cupertino.dart'; 


class FavouriteProductsState with ChangeNotifier {
  final dbHelper = DatabaseHelper.instanse;

  final Future<List<Product>> _favouriteProducts = _init(); 

  static Future<List<Product>> _init() async {
    return await DatabaseHelper.instanse.read();
  }

  Future<bool> isFavourite(Product product) async {
    return await this._favouriteProducts.then((value) => value.contains(product));
  }

  Future<void> changeState(Product product) async {
    if(await this.isFavourite(product)) {
      dbHelper.remove(product.id); 
      await _favouriteProducts.then((value) => value.remove(product));
    } else {
      dbHelper.add(product);
      await _favouriteProducts.then((value) => value.add(product));
    }  
    
    notifyListeners();
  } 

  Future<List<Product>> get favourites => _favouriteProducts;

} 