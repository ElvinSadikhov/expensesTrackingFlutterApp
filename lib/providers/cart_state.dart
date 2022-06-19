import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/providers/helpers/cart_data_helper.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:flutter/cupertino.dart';

class CartState with ChangeNotifier {
  final dbHelper = CartDataHelper.instanse; 

  static Future<List<Purchase>> _getCartItems() async {
    return await CartDataHelper.instanse.read();
  }

  Future<void> addToCart(Purchase purchase) async { 
    List<Purchase> purchases = await _getCartItems();   
 
    if (purchases.contains(purchase)) { 
      int index = purchases.indexOf(purchase); 
      purchases[index] = purchases[index].incrementCount(); 
      dbHelper.update(purchase.incrementCount()); 
    } else {
      purchases.add(purchase); 
      dbHelper.add(purchase);
    } 

    notifyListeners();
  } 

  Future<void> removeFromCart(Purchase purchase) async {
    List<Purchase> purchases = await _getCartItems(); 

    if (purchases[purchases.indexOf(purchase)].count > 1) { 
      purchases[purchases.indexOf(purchase)] = purchases[purchases.indexOf(purchase)].decrementCount(); 
      dbHelper.update(purchase.decrementCount()); 
    } 

    notifyListeners();
  }  

  Future<void> removePurchase(Purchase purchase) async {
    List<Purchase> purchases = await _getCartItems(); 

    purchases.remove(purchase);
    dbHelper.remove(purchase);

    notifyListeners();
  }

  Future<String> getTotalPrice() async { 
    List<Purchase> purchases = await _getCartItems(); 
    double sum = 0;  

    if(purchases.isEmpty) {
      return "";
    } else {
      for (Purchase purchase in purchases) {
        sum += purchase.product.price * purchase.count;
      }
      return PriceBuilder.build(price: sum, currency: purchases[0].product.currency);
    }    
  }

  Future<List<Purchase>> get favourites => _getCartItems(); 

}