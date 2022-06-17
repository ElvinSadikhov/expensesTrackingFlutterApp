import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/helpers/cart_data_helper.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:flutter/cupertino.dart';

class CartState with ChangeNotifier {
  final dbHelper = CartDataHelper.instanse;

  final Future<List<Purchase>> _cartItems = _getCartItems();     

  static Future<List<Purchase>> _getCartItems() async {
    return await CartDataHelper.instanse.read();
  }

  Future<void> addToCart(Purchase purchase) async {
    if (await _cartItems.then((list) => list.contains(purchase))) { 
      await _cartItems.then((list) {
        list[list.indexOf(purchase)] = list[list.indexOf(purchase)].incrementCount();
      }); 
      dbHelper.update(purchase.incrementCount()); 
    } else {
      await _cartItems.then((list) {
        list.add(purchase);
      }); 
      dbHelper.add(purchase);
    } 

    notifyListeners();
  } 

  Future<void> removeFromCart(Purchase purchase) async {
    if (await _cartItems.then((list) => list[list.indexOf(purchase)].count > 1)) { 
      await _cartItems.then((list) {
        list[list.indexOf(purchase)] = list[list.indexOf(purchase)].decrementCount();
      }); 
      dbHelper.update(purchase.decrementCount()); 
    } 

    notifyListeners();
  }  

  Future<void> removePurchase(Purchase purchase) async {
    await _cartItems.then((list) => list.remove(purchase));
    dbHelper.remove(purchase);

    notifyListeners();
  }

  Future<String> getTotalPrice() async { 
    double sum = 0;  
    return await _cartItems.then(
      (list) {
        if(list.isEmpty) {
          return "";
        } else {
          for (Purchase purchase in list) {
            sum += purchase.product.price * purchase.count;
          }
          return PriceBuilder.build(price: sum, currency: list[0].product.currency);
        } 
    });  
  }

  Future<List<Purchase>> get favourites => _cartItems; 

}