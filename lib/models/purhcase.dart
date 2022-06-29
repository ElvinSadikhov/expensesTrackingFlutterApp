// ignore_for_file: unnecessary_this, avoid_renaming_method_parameters, hash_and_equals

import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/utils/extensions/enum_converter.dart';

 
class Purchase {

  final Product product;
  int count;

  Purchase({
    required this.product,
    required this.count
  });

  Purchase decrementCount({int count = 1}) { 
    this.count -= count;
    return this;
  }

  Purchase incrementCount({int count = 1}) {
    this.count += count;
    return this;
  }

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    product: Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      currency: EnumConverter.enumFromString(json['currency'])!, // 
      imageLink: json['imageLink'],
      storeName: json['storeName'],
      storeLocation: json['storeLocation'],
      discountedPrice: json['discountedPrice'],
      description: json['description'],
    ),
    count: json['count']
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map.from(this.product.toJson());
    json.addAll({
      'count': this.count
    }); 

    return json; 
  }

  // TODO: WE COULD REPLACE IT WITH JUST COMPARING Purchase.product == smth.product
  @override
  operator ==(Object o) =>
    o is Purchase &&
    this.product == o.product;

}