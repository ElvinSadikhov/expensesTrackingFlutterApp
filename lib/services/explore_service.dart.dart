import 'package:expenses_tracking_app/data/mock_data.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';
import 'package:expenses_tracking_app/services/product_service.dart';


class ExploreService implements ProductService { 

  @override
  Future<ProductResponse> getProducts() async {
    // kind of  DIO response (takes some amount of time)
    await Future.delayed(const Duration(seconds: 3));
    
    return ProductResponse(products: MockData.products);
  } 

}