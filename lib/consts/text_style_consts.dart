import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:flutter/cupertino.dart';

class TextStyleConsts {

  TextStyleConsts._();

  static const TextStyle appBarLabelStyle = TextStyle( 
    fontWeight: FontWeight.w500,
    color: ColorConsts.black,
  );

  static const TextStyle buttonLabelStyle = TextStyle( 
    fontWeight: FontWeight.w600,
    color: ColorConsts.black, 
  );

  static const TextStyle nonclickableRecommendationStyle = TextStyle( 
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorConsts.black,  
  );

  static const TextStyle clickableRecommendationStyle = TextStyle( 
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorConsts.blue, 
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline,
  );

  static const TextStyle blockTitleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: ColorConsts.black,
  );

  static const TextStyle blockSubtitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorConsts.black,
  );

  static const TextStyle productShortcutTitleStyle = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConsts.black,
  );

  static const TextStyle productShortcutCurrentPriceStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorConsts.black,
  );

  static const productShortcutOldPriceStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorConsts.black,
    decoration: TextDecoration.lineThrough,
  );

  static const productShortcutDiscountStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: ColorConsts.black,
    decoration: TextDecoration.lineThrough,
  );

  static const productInfoMainTitleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: ColorConsts.black, 
  );

  static const productInfoPriceStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorConsts.black, 
  );

  static const productInfoStoreNameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: ColorConsts.black,  
    fontStyle: FontStyle.italic,
  ); 


}