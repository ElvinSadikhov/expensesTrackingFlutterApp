import 'package:expenses_tracking_app/consts/size_consts.dart';  

 
class ProductShortcutSizeProperties{  
  
  static const double shortcutBorderRadius = SizeConsts.productShortcutBorderRadius; 
  static double? shortcutImageHeight;
  static double? shortcutImageWidth;
  static double? shortcutTextHeight;
  static double? discountTagShift;
  static double? discountTagRadius;  

  static double? totalWidgetHeight = shortcutImageHeight != null && discountTagShift != null && shortcutTextHeight != null 
    ? shortcutImageHeight! + discountTagShift! + shortcutTextHeight!
    : null;

}