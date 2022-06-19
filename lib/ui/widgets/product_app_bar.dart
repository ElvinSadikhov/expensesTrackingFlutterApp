import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/favourite_button.dart';
import 'package:flutter/material.dart';


class ProductAppBar extends CustomAppBar {
  final BuildContext? buildContext;
  final Product product; 
  
  ProductAppBar({ Key? key,  
    required this.product,
    String? label,  
    this.buildContext,
  }) : super(key: key, 
        leftIcon: buildContext != null ? CustomBackButton(buildContext: buildContext) : null, 
        label: label, 
        rightIcon: FavouriteButton(product: product)
      );  
}