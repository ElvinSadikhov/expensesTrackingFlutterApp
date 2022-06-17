// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/padding_consts.dart'; 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/alternative_options_service.dart';
import 'package:expenses_tracking_app/ui/widgets/add_to_cart_bottom_panel.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/custom_back_button.dart';
import 'package:expenses_tracking_app/ui/widgets/custom_app_bar.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/favourite_button.dart';
import 'package:expenses_tracking_app/ui/widgets/product_alternatives_block.dart';
import 'package:expenses_tracking_app/ui/widgets/product_info_block.dart';
import 'package:flutter/material.dart';
 

class ProductScreen extends StatefulWidget {
  final Product product;
  
  const ProductScreen({ Key? key, required this.product }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
 
class _ProductScreenState extends State<ProductScreen> {
  AlternativeOptionsService alternativeOptionsService = AlternativeOptionsService();
  ProductResponse? productResponse;

  final double bottomPanelHeight = 70;

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  }

  Future<void> fetchData() async {
    this.productResponse = await this.alternativeOptionsService.getAlternativeProducts(currentProduct: widget.product); 

    if(this.mounted) {
      setState(() { 

      });
    } 
  } 

  @override
  Widget build(BuildContext context) { 

    Size sizeOfScreen = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: CustomAppBar(leftIcon: CustomBackButton(buildContext: context), rightIcon: FavouriteButton(product: widget.product),),  
      body: SizedBox(
        height: sizeOfScreen.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: PaddingConsts.horizontalPadding, right: PaddingConsts.horizontalPadding, bottom: this.bottomPanelHeight),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ProductInfoBlock(product: widget.product, blockHeight: sizeOfScreen.width, blockWidth: sizeOfScreen.width),
                    ProductAlternativesBlock(alternatives: this.productResponse != null ? this.productResponse!.products : null, currentProduct: widget.product), 
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: AddToCartBottomPanel(panelHeight: this.bottomPanelHeight, product: widget.product)
            ),
          ] 
        ),
      ),
    );
  }
}
 