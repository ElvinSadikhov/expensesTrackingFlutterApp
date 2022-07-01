import 'package:expenses_tracking_app/consts/strings.dart'; 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/image_box.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:expenses_tracking_app/utils/helpers/widget_methods.dart';
import 'package:flutter/material.dart';


class ProductInfoBlock extends StatefulWidget {
  final Product product;
  final double blockHeight;
  final double blockWidth;
  
  const ProductInfoBlock({ Key? key, 
    required this.product, 
    required this.blockHeight, 
    required this.blockWidth 
  }) : super(key: key);

  @override
  State<ProductInfoBlock> createState() => _ProductInfoBlockState();
}

class _ProductInfoBlockState extends State<ProductInfoBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            widget.product.title,  
            style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22, fontWeight: FontWeight.w800),
          )  
        ),
        WidgetMethods.verticalSpace(10),
        ImageBox( 
          imageLink: widget.product.imageLink,
          height: widget.blockHeight,
          width: widget.blockWidth,
        ),
        WidgetMethods.verticalSpace(10),
        Align(
          alignment: Alignment.centerRight,
          child: widget.product.discountedPrice != null 
            ? RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: Strings.price,
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22, fontWeight: FontWeight.w800)
                  ),
                  TextSpan(
                    text: PriceBuilder.build(price: widget.product.price, currency: widget.product.currency),
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22, fontWeight: FontWeight.w700, decoration: TextDecoration.lineThrough),
                  ),
                  TextSpan(
                    text: PriceBuilder.build(price: widget.product.discountedPrice!, currency: widget.product.currency),
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22, fontWeight: FontWeight.w700) 
                  ),
                ],
              ),
            ) 
            : Text(
              Strings.price + PriceBuilder.build(price: widget.product.price, currency: widget.product.currency),
              style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22, fontWeight: FontWeight.w700) ,
            ), 
        ),
        WidgetMethods.verticalSpace(10),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Strings.store}: \"${widget.product.storeName}\"",
                style: Theme.of(context).textTheme.headline2!.copyWith(fontStyle: FontStyle.italic),
              ),
              WidgetMethods.verticalSpace(10),
              Text(
                "${Strings.location}: \"${widget.product.storeLocation}\"",
                style: Theme.of(context).textTheme.headline2!.copyWith(fontStyle: FontStyle.italic),
              ),
            ] 
          ),
        ), 
        WidgetMethods.verticalSpace(10),
        widget.product.description != null
          ? RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${Strings.description}: ",
                  style: Theme.of(context).textTheme.headline2!.copyWith(fontStyle: FontStyle.italic),
                ),
                TextSpan(
                  text: widget.product.description, 
                  style: Theme.of(context).textTheme.headline2!, 
                ),
              ]
            ),
          ) 
          : Container(), 
        WidgetMethods.verticalSpace(20)
      ],
    );
  }
}