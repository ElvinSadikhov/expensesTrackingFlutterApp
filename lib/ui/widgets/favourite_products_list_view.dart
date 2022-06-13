 // ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/services/discounted_products_service.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:flutter/material.dart'; 


class FavouriteProductsListView extends StatelessWidget {
  const FavouriteProductsListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductsListView(productService: DiscountedProductsService());
  }
} 