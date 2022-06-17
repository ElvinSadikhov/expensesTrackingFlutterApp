import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/utils/enums/currency.dart';

class MockData {
  static final List<Product> products = [
    Product(id: 1, title: "Coca Cola - 0.5L", price: 0.99, discountedPrice: 0.89, currency: Currency.MANAT, storeName: "Bravo", storeLocation: "Nariman Narimanov 18", imageLink: "https://bazarstore.az/220-large_default/coca-cola-500-ml-pet.jpg?1654964787305", description: "The Coca-Cola Co. is the nonalcoholic beverage company, which engages in the manufacture, market, and sale of non-alcoholic beverages which include sparkling soft drinks, water, enhanced water and sports drinks, juice, dairy and plant-based beverages, tea and coffee and energy drinks."),
    Product(id: 2, title: "Coca Cola - 1L", price: 1.59, currency: Currency.MANAT, storeName: "Bravo", storeLocation: "Gara Garayev 64", imageLink: "https://www.myzaqatala.com/wp-content/uploads/2020/04/5156FefjlqL._SL1000_-600x600.jpg"),
    Product(id: 3, title: "Domestos \"Lemon fresh\" - 1L", price: 3.46, currency: Currency.MANAT, storeName: "Balli", storeLocation: "Neftchiler avenue 109", imageLink: "https://unimall.az/images/detailed/313/1565338956_976a4c22b672553967f1e366b684ef7d.jpg"),
    Product(id: 4, title: "Lay's \"Cheese\"- 150Gr", price: 2.6, discountedPrice: 1.99, currency: Currency.MANAT, storeName: "Araz", storeLocation: "near 28 MAY m/s", imageLink: "https://bravomarket.online/upload/iblock/8f7/8f7ed58bd9514e716215cb1ecb146aa9.jpg"),
    Product(id: 5, title: "Westgold butter - 0.227Kg", price: 10.99, discountedPrice: 8.97, currency: Currency.MANAT, storeName: "Neptun", storeLocation: "Sumgayit", imageLink: "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(id: 6, title: "Eggs - 10P", price: 1.75, discountedPrice: 1.19, currency: Currency.MANAT, storeName: "Khazar", storeLocation: "near Gandjlick m/s", imageLink: "https://images.megapixl.com/5703/57031776.jpg"),
    Product(id: 7, title: "Sirab - 2L", price: 1.39, currency: Currency.MANAT, storeName: "Bazar Store", storeLocation: "Ziya Bunyadov 3", imageLink: "https://bazarstore.az/234-large_default/sirab-qazli-su-1lt-pet.jpg"),
    Product(id: 8, title: "Alpen Gold \"Black Chocolate\"", price: 1.24, discountedPrice: 0.99, currency: Currency.MANAT, storeName: "Bazar Store", storeLocation: "Memar Adjemy 99", imageLink: "https://unimall.az/images/detailed/182/a47.jpg"), 
    Product(id: 9, title: "Westgold butter - 0.227Kg", price: 11.49, discountedPrice: 8.97, currency: Currency.MANAT, storeName: "Bravo", storeLocation: "Zabrat", imageLink: "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(id: 10, title: "Westgold butter - 0.227Kg", price: 10.13, currency: Currency.MANAT, storeName: "Balli", storeLocation: "Gunewli dist.", imageLink: "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
    Product(id: 11, title: "Westgold butter - 0.227Kg", price: 9.98, discountedPrice: 8.19, currency: Currency.MANAT, storeName: "Khazar", storeLocation: "Gunewli dist.", imageLink: "https://westgold.com/assets/article-images/J003174-USA-Butter-Render-227g-Salted-Cream-Background-v2__FillWzk4MCw3MDBd.jpg"),
  
  ];
}