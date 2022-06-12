import 'package:flutter/material.dart';

class Product {  
  final int id;
  final String title;
  final double price;
  final Currency currency;
  final String imageLink;
  final double? discountedPrice;
  final String storeName;
  final String storeLocation; 
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

}

enum Currency {
  DOLLAR,
  EURO,
  MANAT
}