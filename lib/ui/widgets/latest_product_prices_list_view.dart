import 'package:expenses_tracking_app/services/explore_service.dart.dart';
import 'package:expenses_tracking_app/services/product_service.dart';
import 'package:expenses_tracking_app/ui/widgets/helpers/products_list_view.dart';
import 'package:flutter/material.dart';


class LatestProductPricesListView extends StatefulWidget {
  const LatestProductPricesListView({ Key? key }) : super(key: key);

  @override
  State<LatestProductPricesListView> createState() => _LatestProductPricesListViewState();
}

class _LatestProductPricesListViewState extends State<LatestProductPricesListView> {
  @override
  Widget build(BuildContext context) { 
    return ProductsListView(productService: ExploreService(),);
  }
}