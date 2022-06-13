// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:flutter/cupertino.dart';



// TODO: delete this provider as there is NO changing state at all
// instead we could create ProductSizeConsts in consts folder
class ProductState with ChangeNotifier{

  // final List<Product> _productList = Products.products; 
  final double _shortcutBorderRadius = SizeConsts.productShortcutBorderRadius; 
  double? _shortcutImageHeight;
  double? _shortcutImageWidth;
  double? _shortcutTextHeight;
  double? _discountTagShift;
  double? _discountTagRadius; 
  

  // List<Product> get productList => _productList;
  double? get shortcutBorderRadius => _shortcutBorderRadius;
  double? get shortcutImageHeight => _shortcutImageHeight;
  double? get shortcutImageWidth => _shortcutImageWidth;
  double? get shortcutTextHeight => _shortcutTextHeight;
  double? get discountTagShift => _discountTagShift; 
  double? get discountTagRadius => _discountTagRadius; 

  set shortcutImageHeight(double? value) => this._shortcutImageHeight = value; 
  set shortcutImageWidth(double? value) => this._shortcutImageWidth = value; 
  set shortcutTextHeight(double? value) => this._shortcutTextHeight = value; 
  set shortcutTopPadding(double? value) => this._discountTagShift = value;  
  set discountTagRadius(double? value) => this._discountTagRadius = value; 

}