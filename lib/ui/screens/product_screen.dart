// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/favourite_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_info_block.dart';
import 'package:flutter/material.dart';


class ProductScreen extends StatelessWidget {
  final Product product;
  
  const ProductScreen({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size sizeOfScreen = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: CustomAppBar(leftIcon: CustomBackButton(buildContext: context), rightIcon: FavouriteButton(product: this.product),), // TODO: check it
      body: Padding(
        padding: const EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding),
        child: Column(
          children: [
            ProductInfoBlock(product: this.product, height: sizeOfScreen.width * 0.8 / 1.5, width: sizeOfScreen.width * 0.8)
          ],
        ),
      ),
    );
  }
}