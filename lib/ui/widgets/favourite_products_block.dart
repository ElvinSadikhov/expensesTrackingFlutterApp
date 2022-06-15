import 'package:expenses_tracking_app/consts/strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:expenses_tracking_app/ui/screens/favourite_products_screen.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/block_label.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_block.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavouriteProductsBlock extends StatelessWidget {
  const FavouriteProductsBlock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProductsState>(
      builder: (context, FavouriteProductsState favouriteProductsState, _) {
        return FutureBuilder<List<Product>>(
          future: favouriteProductsState.favourites,
          builder: (context, snapshot) {
            List<Product>? products = snapshot.hasData ? snapshot.data : null;

            return ProductBlock(
              blockLabel: BlockLabel(
                title: Strings.favouriteProducts,
                onTap: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavouriteProductsScreen(products: products))
                  );
                },
              ), 
              productListView: ProductsListView(products: products)
            );
          }, 
        );
      }
    );       
  }
}