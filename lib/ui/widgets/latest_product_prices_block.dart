// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart'; 
import 'package:expenses_tracking_app/services/explore_service.dart.dart';
import 'package:expenses_tracking_app/ui/screens/latest_product_prices_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart';


class LatestProductPricesBlock extends StatefulWidget {
  const LatestProductPricesBlock({ Key? key }) : super(key: key);

  @override
  State<LatestProductPricesBlock> createState() => _LatestProductPricesBlockState();
}
 
class _LatestProductPricesBlockState extends State<LatestProductPricesBlock> {
  ExploreService exploreService = ExploreService();
  ProductResponse? productResponse; 
  List<Product>? products;

  @override
  void initState() { 
    super.initState();

    fetchData();
  }
  
  Future<void> fetchData() async {
    this.productResponse = await this.exploreService.getAllProducts();
    this.products = this.productResponse != null ? this.productResponse!.products : null;

    if(this.mounted) {
      setState(() { 

      });
    } 
  }
   
  @override
  Widget build(BuildContext context) {
    return ProductBlock(
      blockLabel: BlockLabel(
        title: Strings.latestProductPrices, 
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => LatestProductPricesScreen(products: products))
          );
        },
      ), 
      productListView: ProductsListView(products: this.products)
    ); 
  }
} 