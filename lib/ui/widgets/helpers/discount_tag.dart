// ignore_for_file: unnecessary_this
  
import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:flutter/material.dart';


class DiscountTag extends StatelessWidget {
  final double radius;
  final double actualPrice;
  final double discountedPrice;
  
  const DiscountTag({ Key? key, 
    required this.actualPrice, 
    required this.discountedPrice, 
    required this.radius 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.radius,
      width: this.radius,
      child: Center(
        child: Text(
          PriceTagBuilder.calculatedDiscountPercentage(actualPrice: this.actualPrice, discountedPrice: this.discountedPrice),
          style: TextStyleConsts.productShortcutDiscountStyle,
        ),
      ),
      decoration: BoxDecoration(
        color: ColorConsts.discountTagColor,
        shape: BoxShape.circle,
        border: Border.all(width: 1) // TOFO: WRITE IT TO SIZE CONSTS( AND NOT ONLY THIS ONE BUT OTHERS TOO ) 
      ),
    );
  }
}