import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/widgets/discounnted_products_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DiscountedProductsBlock extends StatefulWidget {
  const DiscountedProductsBlock({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsBlock> createState() => _DiscountedProductsBlockState();
}

class _DiscountedProductsBlockState extends State<DiscountedProductsBlock> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [ 
        BlockLabel(title: Strings.discountedProducts,),
        DiscountedProductsListView()

      ],
    );
  }
}