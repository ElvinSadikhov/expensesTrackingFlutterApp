import 'package:expenses_tracking_app/data/products.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';


class MockData { 

  Future<ProductResponse> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    
    return ProductResponse(products: Products.products);
  } 
  
}