// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/explore_service.dart.dart';
import 'package:expenses_tracking_app/services/product_service.dart'; 


class DiscountedProductsService implements ProductService {  
   
  @override
  Future<ProductResponse> getProducts() async {     
    ExploreService exploreService = ExploreService();
    ProductResponse productResponse = await exploreService.getProducts();
     
    List<Product> allProducts = productResponse.products;

    List<Product> discountedProducts = [];
    for (Product product in allProducts) {
      if (product.discountedPrice != null) {
        discountedProducts.add(product);
      }
    }
    
    return ProductResponse(products: discountedProducts);
  } 


}