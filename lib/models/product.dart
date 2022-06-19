// ignore_for_file: unnecessary_this, avoid_renaming_method_parameters, hash_and_equals

import 'package:expenses_tracking_app/utils/enums/currency.dart';
import 'package:expenses_tracking_app/utils/extensions/enum_converter.dart'; 

 
class Product {  
  final int id;
  final String title;
  final double price;
  final Currency currency;
  final String imageLink; 
  final String storeName;
  final String storeLocation; 
  final double? discountedPrice;
  final String? description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.currency,
    required this.storeName, 
    required this.storeLocation, 
    required this.imageLink,
    this.discountedPrice,
    this.description 
  }); 

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    price: json['price'],
    currency: EnumConverter.enumFromString(json['currency'])!, // 
    imageLink: json['imageLink'],
    storeName: json['storeName'],
    storeLocation: json['storeLocation'],
    discountedPrice: json['discountedPrice'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'currency': currency.enumToString(), 
      'imageLink': imageLink,
      'storeName': storeName,
      'storeLocation': storeLocation,
      'discountedPrice': discountedPrice,
      'description': description,
    };
  }

  @override
  operator ==(Object o) =>
    o is Product &&
    this.id == o.id &&
    this.title == o.title &&
    this.currency == o.currency &&
    this.imageLink == o.imageLink &&
    this.storeName == o.storeName &&
    this.storeLocation == o.storeLocation &&
    this.discountedPrice == o.discountedPrice &&
    this.description == o.description;

}  