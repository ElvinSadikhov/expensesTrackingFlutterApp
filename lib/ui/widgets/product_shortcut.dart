// ignore_for_file: unnecessary_this, prefer_function_declarations_over_variables

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart'; 
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/screens/product_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/discount_tag.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/image_box.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class ProductShortcut extends StatelessWidget {
  final Product product; 
  final double borderRadiusValue;
  final double containerSize;
  final double discountTagRadius;
  final double discountTagShift; 

  // TODO: BURA YAZMAQ OLARI

  const ProductShortcut({ Key? key, 
    required this.product,   
    required this.containerSize, 
    required this.discountTagRadius, 
    required this.discountTagShift,  
    this.borderRadiusValue = SizeConsts.productShortcutBorderRadius, 
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: this.product,)));
      },
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
                  ImageBox(
                    borderRadiusValue: this.borderRadiusValue, 
                    imageLink: this.product.imageLink, 
                    height: this.containerSize, 
                    width: this.containerSize
                  ), 
                  Text(this.product.title, 
                    style: TextStyleConsts.productShortcutTitleStyle,
                  ),
                  this.product.discountedPrice != null 
                    ? RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: PriceBuilder.build(price: this.product.price, currency: this.product.currency) + " ",
                              style: TextStyleConsts.productShortcutOldPriceStyle,
                            ),
                            TextSpan(
                              text: PriceBuilder.build(price: this.product.discountedPrice!, currency: this.product.currency),
                              style: TextStyleConsts.productShortcutCurrentPriceStyle 
                            ),
                          ],
                        ),
                      ) 
                      : Text(PriceBuilder.build(price: this.product.price, currency: this.product.currency),
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
                ) 
                : Container(),
            ), 
          ],
        ),
      ),
    );
  }
}