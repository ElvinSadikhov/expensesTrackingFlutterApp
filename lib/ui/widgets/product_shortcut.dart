// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/data/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/discount_tag.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class ProductShortcut extends StatelessWidget {
  final Product product;
  final Function()? onTap;
  final double borderRadiusValue;
  final double containerSize;
  final double discountTagRadius;
  final double discountTagShift;

  const ProductShortcut({ Key? key, 
    required this.product,   
    required this.containerSize, 
    required this.discountTagRadius, 
    required this.discountTagShift, 
    this.borderRadiusValue = SizeConsts.productShortcutBorderRadius,
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: this.onTap,
      child: SizedBox(  
        width: this.containerSize + this.discountTagShift,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetMethods.verticalSpace(this.discountTagShift),
                  Card( 
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(this.borderRadiusValue),
                        side: const BorderSide(width: 1.5, color: ColorConsts.black)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(this.borderRadiusValue),
                      child: Image.network(this.product.imageLink, 
                        fit: BoxFit.cover,
                        height: this.containerSize,
                        width: this.containerSize,
                      ),
                    ),
                  ),
                  Text(this.product.title, 
                    style: TextStyleConsts.productShortcutTitleStyle,
                  ),
                  this.product.discountedPrice != null 
                    ? RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: PriceTagBuilder.build(price: this.product.price, currency: this.product.currency),
                              style: TextStyleConsts.productShortcutOldPriceStyle,
                            ),
                            TextSpan(
                              text: PriceTagBuilder.build(price: this.product.discountedPrice!, currency: this.product.currency),
                              style: TextStyleConsts.productShortcutCurrentPriceStyle 
                            ),
                          ],
                        ),
                      ) 
                      : Text(PriceTagBuilder.build(price: this.product.price, currency: this.product.currency),
                        style: TextStyleConsts.productShortcutCurrentPriceStyle), 
                ],
              ),
            ), 
            Positioned( 
              right: 0,
              child: this.product.discountedPrice != null
                ? DiscountTag(
                  actualPrice: this.product.price, 
                  discountedPrice: this.product.discountedPrice!, 
                  radius: this.discountTagRadius, 
                ) : Container(),
            ), 
          ],
        ),
      ),
    );
  }
}