// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/discounted_products_service.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:flutter/material.dart'; 

class DiscountedProductsListView extends StatefulWidget {
  const DiscountedProductsListView({ Key? key }) : super(key: key);

  @override
  State<DiscountedProductsListView> createState() => _DiscountedProductsListViewState();
}

class _DiscountedProductsListViewState extends State<DiscountedProductsListView> { 
  DiscountedProductsService discountedProductsService = DiscountedProductsService();
  ProductResponse productResponse = ProductResponse(products: []); 

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  }

  Future<void> fetchData() async {
    productResponse = await discountedProductsService.getProducts();
    setState(() { 

    });
  }

  @override
  Widget build(BuildContext context) {
    return ProductsListView(products: productResponse.products);
  }
}

// class DiscountedProductsListView extends StatelessWidget {
//   const DiscountedProductsListView({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ProductsListView(productService: DiscountedProductsService());
//   }
// } 