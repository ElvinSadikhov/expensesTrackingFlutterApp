import 'package:expenses_tracking_app/data/mock_data.dart';
import 'package:expenses_tracking_app/models/product.dart'; 
import 'package:expenses_tracking_app/models/responses/product_response.dart'; 

class AlternativeOptionsService {
    
  Future<ProductResponse> getAlternativeProducts({required Product currentProduct}) async {
    await Future.delayed(const Duration(seconds: 1)); 
    ProductResponse allProducts = ProductResponse(products: MockData.products);
 
    return ProductResponse(
      products: allProducts.products.where(
        (product) => currentProduct.title == product.title && currentProduct.id != product.id
      ).toList()
    );
  }

}