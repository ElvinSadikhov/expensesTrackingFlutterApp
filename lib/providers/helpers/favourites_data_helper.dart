// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/db_strings.dart';
import 'package:expenses_tracking_app/models/fields/product_fields.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:expenses_tracking_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart'; 


class FavouritesDataHelper {

  static final FavouritesDataHelper instanse = FavouritesDataHelper._init();

  static Database? _database;

  FavouritesDataHelper._init();

  Future<Database> get database async {  
    if(_database != null) return _database!;

    _database = await _initDB(DBStrings.dbFavouritesFileName);
    
    return _database!; 
  }

  Future<Database> _initDB(String filePath) async {  
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    debugPrint("init db");

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async { 
//     await db.execute('''
// CREATE TABLE IF NOT EXISTS ${DBStrings.dbFavouritesTableName} (
//   ${ProductFields.id} ${DBStrings.idType},
//   ${ProductFields.title} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.price} ${DBStrings.numericType} ${DBStrings.notNull},
//   ${ProductFields.currency} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.imageLink} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.storeName} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.storeLocation} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.discountedPrice} ${DBStrings.numericType},
//   ${ProductFields.description} ${DBStrings.textType}
// ); 
//     ''');   
    await db.execute('''
CREATE TABLE IF NOT EXISTS ${DBStrings.dbFavouritesTableName} (
  ${ProductFields.id} ${DBStrings.idType} 
); 
    '''); 
  }
    

  Future<List<Product>> read() async {
    final db = await instanse.database; 
    ProductService productService = ProductService();

    // var products = await db.query(DBStrings.dbFavouritesTableName);
    var jsons = await db.query(DBStrings.dbFavouritesTableName); 
    // this.close();

    if(jsons.isNotEmpty) {
      List<Product> products = [];
      for(Map<String, Object?> json in jsons) {
        products.add((await productService.getProductById(json['id'] as int)).products[0]);
      } 
      return products;
    }
    return [];

    // return products.isNotEmpty
    //   ? products.map((pr) => Product.fromJson(pr)).toList()
    //     : []; 
  }

  Future<int> add(Product product) async {
    final db = await instanse.database; 
    // int result = await db.insert(DBStrings.dbFavouritesTableName, product.toJson());
    int result = await db.insert(DBStrings.dbFavouritesTableName, {'id': product.id});

    // this.close(); 
    return result;
    
  }

  Future<int> remove(Product product) async {
    final db = await instanse.database;
    int result = await db.delete(DBStrings.dbFavouritesTableName, where: "${ProductFields.id} = ?", whereArgs: [product.id]);

    // this.close();
    return result;
  }

  Future<int> update(Product product) async {
    final db = await instanse.database;

    int result = await db.update(DBStrings.dbFavouritesTableName, product.toJson(), where: "${ProductFields.id} = ?", whereArgs: [product.id]);

    // this.close();
    return result;
  }

  Future<void> close() async {
    final db = await instanse.database;

    _database = null; 

    await db.close(); 
    debugPrint("closed db");
  } 
  
}