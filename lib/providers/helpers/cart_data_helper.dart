// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/db_strings.dart';
import 'package:expenses_tracking_app/models/fields/product_fields.dart';
import 'package:expenses_tracking_app/models/fields/purchase_fields.dart';
import 'package:expenses_tracking_app/models/product.dart'; 
import 'package:expenses_tracking_app/models/purhcase.dart';
import 'package:expenses_tracking_app/services/product_service.dart'; 
import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart'; 


class CartDataHelper {

  static final CartDataHelper instanse = CartDataHelper._init();

  static Database? _database;

  CartDataHelper._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB(DBStrings.dbCartFileName);
    
    return _database!; 
  }

  Future<Database> _initDB(String filePath) async {   
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {  
//     await db.execute('''
// CREATE TABLE IF NOT EXISTS ${DBStrings.dbCartTableName} (
//   ${ProductFields.id} ${DBStrings.idType},
//   ${ProductFields.title} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.price} ${DBStrings.numericType} ${DBStrings.notNull},
//   ${ProductFields.currency} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.imageLink} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.storeName} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.storeLocation} ${DBStrings.textType} ${DBStrings.notNull},
//   ${ProductFields.discountedPrice} ${DBStrings.numericType},
//   ${ProductFields.description} ${DBStrings.textType},
//   ${PurchaseFields.count} ${DBStrings.integerType} ${DBStrings.notNull}
// ); 
//     ''');  
    await db.execute('''
CREATE TABLE IF NOT EXISTS ${DBStrings.dbCartTableName} (
  ${ProductFields.id} ${DBStrings.idType}, 
  ${PurchaseFields.count} ${DBStrings.integerType} ${DBStrings.notNull}
); 
    '''); 
  }
    

  Future<List<Purchase>> read() async {
    final db = await instanse.database; 

    // var purchases = await db.query(DBStrings.dbCartTableName);

    // this.close();
    // return purchases.isNotEmpty
    //   ? purchases.map((purchase) => Purchase.fromJson(purchase)).toList()
    //     : []; 

    ProductService productService = ProductService(); 

    var jsons = await db.query(DBStrings.dbCartTableName);

    
    if(jsons.isNotEmpty) {
      List<Purchase> purchases = [];
      for(Map<String, Object?> json in jsons) {
        purchases.add(Purchase(
          product: (await productService.getProductById(json['id'] as int)).products[0], 
          count: json['count'] as int
        ));
      }

      this.close();
      return purchases;
    }
    return []; 
  }

  Future<int> add(Purchase purchase) async {
    final db = await instanse.database; 
    // int result = await db.insert(DBStrings.dbCartTableName, purchase.toJson());
    int result = await db.insert(DBStrings.dbCartTableName, {'id': purchase.product.id, 'count': purchase.count});

    this.close(); 
    return result; 
  }

  Future<int> remove(Purchase purchase) async {
    final db = await instanse.database;
    int result = await db.delete(DBStrings.dbCartTableName, where: "${ProductFields.id} = ?", whereArgs: [purchase.product.id]);

    this.close();
    return result;
  }

  Future<int> update(Purchase purchase) async {
    final db = await instanse.database;

    int result = await db.update(DBStrings.dbCartTableName, purchase.toJson(), where: "${ProductFields.id} = ?", whereArgs: [purchase.product.id]);

    this.close();
    return result;
  }

  Future close() async {
    final db = await instanse.database;

    _database = null;

    db.close();
  } 
  
}