import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/ui/screens/latest_product_prices_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/latest_product_prices_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart';

class LatestProductPricesBlock extends StatelessWidget {
  const LatestProductPricesBlock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductBlock(
      blockLabel: BlockLabel(
        title: Strings.latestProductPrices, 
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const LatestProductPricesScreen())
          );
        }
      ), 
      productListView: const LatestProductPricesListView()
    ); 
  }
} 