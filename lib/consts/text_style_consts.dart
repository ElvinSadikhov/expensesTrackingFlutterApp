import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:flutter/cupertino.dart';

class TextStyleConsts {

  TextStyleConsts._();

  static const TextStyle appBarLabelStyle = TextStyle( 
    fontWeight: FontWeight.w500,
    color: ColorConsts.black
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
    fontStyle: FontStyle.italic
  );

}