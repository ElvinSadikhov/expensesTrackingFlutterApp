// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/providers/product_state.dart';
import 'package:expenses_tracking_app/services/discounted_products_service.dart';
import 'package:expenses_tracking_app/services/product_service.dart'; 
import 'package:expenses_tracking_app/ui/widgets/product_shortcut.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductsListView extends StatefulWidget {

  final ProductService productService;
  

  const ProductsListView({ Key? key, required this.productService }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> { 
  ProductResponse productResponse = ProductResponse(products: []);

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  }

  Future<void> fetchData() async { 
    productResponse = await widget.productService.getProducts(); 
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {  
    return Consumer<ProductState>(
      builder: (context, ProductState productState, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: this.productResponse.products.isNotEmpty
            ? SizedBox( 
            height: productState.shortcutImageHeight! + productState.discountTagShift! + productState.shortcutTextHeight!, 
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: this.productResponse.products.length,
              itemBuilder: (BuildContext context, int index) => 
                ProductShortcut(
                  product: this.productResponse.products[index], 
                  containerSize: productState.shortcutImageHeight!, 
                  discountTagRadius: productState.discountTagRadius!, 
                  discountTagShift: productState.discountTagShift!
                )
              ), 
          )
            : const CircularProgressIndicator(),
        );
      }, 
    );  
  }
}