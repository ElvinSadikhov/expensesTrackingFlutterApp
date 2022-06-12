import 'package:expenses_tracking_app/data/strings.dart';
import 'package:expenses_tracking_app/ui/widgets/discounnted_products_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart'; 


class DiscountedProductsBlock extends StatefulWidget {
  const DiscountedProductsBlock({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsBlock> createState() => _DiscountedProductsBlockState();
}

class _DiscountedProductsBlockState extends State<DiscountedProductsBlock> {
  @override
  Widget build(BuildContext context) {
    // TODO: MAKE IT INHERITED WIDGET ( .OF STUFF)
    return const ProductBlock(blockLabel: BlockLabel(title: Strings.discountedProducts,), child: DiscountedProductsListView());
  }
}