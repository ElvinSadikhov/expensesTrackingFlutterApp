// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/db_strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart';
import 'package:flutter/material.dart';


class DatabaseHelper{

  static final DatabaseHelper instanse = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB(DBStrings.dbFileName);
    
    return _database!; 
  }

  Future<Database> _initDB(String filePath) async {
    debugPrint("initDB");

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async { 
    await db.execute('''
CREATE TABLE IF NOT EXISTS ${DBStrings.dbTableName} (
  ${ProductFields.id} ${DBStrings.idType},
  ${ProductFields.title} ${DBStrings.textType} ${DBStrings.notNull},
  ${ProductFields.price} ${DBStrings.numericType} ${DBStrings.notNull},
  ${ProductFields.currency} ${DBStrings.textType} ${DBStrings.notNull},
  ${ProductFields.imageLink} ${DBStrings.textType} ${DBStrings.notNull},
  ${ProductFields.storeName} ${DBStrings.textType} ${DBStrings.notNull},
  ${ProductFields.storeLocation} ${DBStrings.textType} ${DBStrings.notNull},
  ${ProductFields.discountedPrice} ${DBStrings.numericType},
  ${ProductFields.description} ${DBStrings.textType}
); 
    ''');  
  }
    

  Future<List<Product>> read() async {
    final db = await instanse.database; 

    var products = await db.query(DBStrings.dbTableName);

    this.close();
    return products.isNotEmpty
      ? products.map((pr) => Product.fromJson(pr)).toList()
        : []; 
  }

  Future<int> add(Product product) async {
    final db = await instanse.database; 
    int result = await db.insert(DBStrings.dbTableName, product.toJson());

    this.close(); 
    return result;
    
  }

  Future<int> remove(int id) async {
    final db = await instanse.database;
    int result = await db.delete(DBStrings.dbTableName, where: "${ProductFields.id} = ?", whereArgs: [id]);

    this.close();
    return result;
  }

  Future<int> update(Product product) async {
    final db = await instanse.database;

    int result = await db.update(DBStrings.dbTableName, product.toJson(), where: "${ProductFields.id} = ?", whereArgs: [product.id]);

    this.close();
    return result;
  }

  Future close() async {
    final db = await instanse.database;

    _database = null;

    db.close();
  } 
  
}