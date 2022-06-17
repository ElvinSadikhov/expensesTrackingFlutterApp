// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/purchase_count_control_panel.dart';
import 'package:expenses_tracking_app/ui/widgets/labeled_button.dart';
import 'package:flutter/material.dart';


class AddToCartBottomPanel extends StatelessWidget {
  final Product product;
  final double panelHeight;
  
  const AddToCartBottomPanel({ Key? key, required this.panelHeight, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Container(
      height: this.panelHeight,
      width: sizeOfScreen.width,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
          PurchaseCountControlPanel(product: this.product),
          LabeledButton( 
            label: Strings.addToCart, 
            onTap: () {



            },  
          )
        ],
      ),
    );
  }
}