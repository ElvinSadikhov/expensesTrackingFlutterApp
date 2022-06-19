import 'package:expenses_tracking_app/data/mock_data.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/models/responses/product_response.dart';

class ProductService {

  Future<ProductResponse> getProductById(int id) async {
    Future.delayed(const Duration(seconds: 2));

    for (Product product in MockData.products) {
      if (product.id == id) return ProductResponse(products: [product]);
    }
    
    return ProductResponse(products: []);
  }

}