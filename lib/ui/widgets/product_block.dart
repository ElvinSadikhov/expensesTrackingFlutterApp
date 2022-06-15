// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:flutter/material.dart';


class ProductBlock extends StatelessWidget {
  final BlockLabel blockLabel;
  final Widget productListView; 

  const ProductBlock({ Key? key, required this.blockLabel, required this.productListView }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        this.blockLabel,
        this.productListView 
      ],
    );
  }
}