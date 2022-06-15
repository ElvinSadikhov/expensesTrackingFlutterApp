// ignore_for_file: unnecessary_this
 
import 'package:expenses_tracking_app/models/responses/product_response.dart'; 
import 'package:expenses_tracking_app/services/explore_service.dart.dart'; 
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart'; 
import 'package:flutter/material.dart'; 

class LatestProductPricesListView extends StatefulWidget {
  const LatestProductPricesListView({ Key? key }) : super(key: key);

  @override
  State<LatestProductPricesListView> createState() => _LatestProductPricesListViewState();
}

class _LatestProductPricesListViewState extends State<LatestProductPricesListView> { 
  ExploreService exploreService = ExploreService();
  ProductResponse? productResponse; 

  @override
  void initState() { 
    super.initState();

    this.fetchData();
  }

  Future<void> fetchData() async {
    productResponse = await exploreService.getProducts();
    
    if(this.mounted) {
      setState(() { 

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProductsListView(products: productResponse != null ? productResponse!.products : null);
  }
}