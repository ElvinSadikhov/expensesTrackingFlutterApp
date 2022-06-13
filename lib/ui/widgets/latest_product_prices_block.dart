import 'package:expenses_tracking_app/data/strings.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/latest_product_prices_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart';

class LatestProductPricesBlock extends StatelessWidget {
  const LatestProductPricesBlock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductBlock(blockLabel: BlockLabel(title: Strings.latestProductPrices,), child: LatestProductPricesListView()); 
  }
} 