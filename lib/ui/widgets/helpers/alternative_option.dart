// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart'; 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/screens/product_screen.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/change_indicator.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class AlternativeOption extends StatelessWidget {
  final Product alternative;
  final Product currentProduct;

  const AlternativeOption({ Key? key, required this.alternative, required this.currentProduct }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ProductScreen(product: this.alternative))
        );
      },
      child: Container( 
  child: Card( 
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(width: 2, color: ColorConsts.black)
    ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Column( 
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.alternative.storeName,
                    style: Theme.of(context).textTheme.headline3!,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.alternative.storeLocation,
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ), 
            Align(
              alignment: Alignment.centerRight,
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DifferenceIndicator(
                    priceDifferenceInPercentage: PriceBuilder.calculateDifferenceInPercentage(actualPrice: this.currentProduct.discountedPrice ?? this.currentProduct.price, anotherPrice: this.alternative.discountedPrice ?? this.alternative.price)
                  ),
                  WidgetMethods.horizontalSpace(5),
                  Text(
                    PriceBuilder.build(price: this.alternative.discountedPrice ?? this.alternative.price, currency: this.alternative.currency),
                    style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),  
    ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 5.0,
            offset: const Offset(0, 2),
            spreadRadius: 0.00001,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
    )
    );
  }
}

