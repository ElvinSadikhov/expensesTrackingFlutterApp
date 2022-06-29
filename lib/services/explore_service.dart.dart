import 'package:expenses_tracking_app/data/mock_data.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart'; 


class ExploreService { 
 
  Future<ProductResponse> getAllProducts() async {
    // kind of  DIO response (takes some amount of time)
    await Future.delayed(const Duration(seconds: 1));
    
    return ProductResponse(products: MockData.products);
  } 

}