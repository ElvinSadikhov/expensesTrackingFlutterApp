import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/consts/text_style_consts.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/image_box.dart';
import 'package:expenses_tracking_app/utils/helpers/price_builder.dart';
import 'package:flutter/material.dart';


class ProductInfoBlock extends StatefulWidget {
  final Product product;
  final double height;
  final double width;
  
  const ProductInfoBlock({ Key? key, 
    required this.product, 
    required this.height, 
    required this.width 
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
            style: TextStyleConsts.productInfoMainTitleStyle,
          )  
        ),
        ImageBox( 
          imageLink: widget.product.imageLink,
          height: widget.height,
          width: widget.width,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Strings.bestPrice 
              + ": " 
                + PriceBuilder.build(
                    price: widget.product.discountedPrice != null 
                      ? widget.product.discountedPrice!
                        : widget.product.price, 
                    currency: widget.product.currency
                  ),
            style: TextStyleConsts.productInfoPriceStyle,
          ), 
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                "\"${widget.product.title}\"",
                style: TextStyleConsts.productInfoStoreNameStyle,
              ),
              Text(
                Strings.location + ": " + widget.product.storeLocation,
                style: TextStyleConsts.productInfoStoreNameStyle.copyWith(fontWeight: FontWeight.w500),
              ),
            ] 
          ),
        ), 
        widget.product.description != null
          ? Text(
            Strings.description + ": " + widget.product.description!,
            style: TextStyleConsts.productInfoStoreNameStyle.copyWith(fontWeight: FontWeight.w500),
          )
            : Container(),
        
      ],
    );
  }
}