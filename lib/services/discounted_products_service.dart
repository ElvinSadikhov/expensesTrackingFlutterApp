// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/data/mock_data.dart'; 
import 'package:expenses_tracking_app/models/responses/product_response.dart';  


class DiscountedProductsService {  
    
  Future<ProductResponse> getDiscountedProducts() async {     
    await Future.delayed(const Duration(seconds: 3)); 
    ProductResponse productResponse = ProductResponse(products: MockData.products); 
    
    return ProductResponse(products: 
      productResponse.products.where(
        (product) => product.discountedPrice != null
      ).toList()
    );
  } 


}