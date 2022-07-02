// ignore_for_file: prefer_const_constructors, unnecessary_this
 
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/discounted_products_service.dart';
import 'package:expenses_tracking_app/ui/screens/discounted_products_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart';
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DiscountedProductsBlock extends StatefulWidget { 
  
  const DiscountedProductsBlock({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsBlock> createState() => _DiscountedProductsBlockState();
}

class _DiscountedProductsBlockState extends State<DiscountedProductsBlock> { 
  DiscountedProductsService discountedProductsService = DiscountedProductsService();
  ProductResponse? productResponse; 
  
  List<Product>? products;

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  }
  
  Future<void> fetchData() async {
    this.productResponse = await this.discountedProductsService.getDiscountedProducts();
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
        title: AppLocalizations.of(context)!.discountedProducts, 
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => DiscountedProductsScreen(products: products))
          );
        },
      ), 
      productListView: ProductsListView(products: this.products)
    );
  }
} 