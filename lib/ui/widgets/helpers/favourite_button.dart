import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/size_consts.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/providers/favourite_products_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavouriteButton extends StatefulWidget {
  final Product product;
  
  const FavouriteButton({ Key? key, required this.product }) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProductsState>(
      builder: (context, FavouriteProductsState favouriteProductsState, _) { 
        return FutureBuilder(
          future: favouriteProductsState.isFavourite(widget.product),
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                favouriteProductsState.changeState(widget.product);
              },
              child: snapshot.hasData
              ? Icon( 
                snapshot.data == true ? Icons.favorite : Icons.favorite_outline_outlined , 
                color: snapshot.data == true ? ColorConsts.red : ColorConsts.black,
                size: SizeConsts.kDefaultAppBarButtonSize,
              ) 
                : Container(),
            );
          }
        ); 
      }, 
    );
  }
} 