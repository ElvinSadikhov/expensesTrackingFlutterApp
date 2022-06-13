import 'package:expenses_tracking_app/consts/db_strings.dart';
import 'package:expenses_tracking_app/models/product.dart';
import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart';


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
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBStrings.dbTableName} (
        ${ProductFields.id} ${DBStrings.idType},
        ${ProductFields.title} ${DBStrings.stringType},
        ${ProductFields.price} ${DBStrings.doubleType},
        ${ProductFields.currency} ${DBStrings.stringType},
        ${ProductFields.imageLink} ${DBStrings.stringType},
        ${ProductFields.storeName} ${DBStrings.stringType},
        ${ProductFields.storeLocation} ${DBStrings.stringType},
        ${ProductFields.discountedPrice} ${DBStrings.nullableDoubleType},
        ${ProductFields.description} ${DBStrings.nullableStringType},
      )  
    ''');
  }

  Future<List<Product>> read() async {
    final db = await instanse.database;

    var products = await db.query(DBStrings.dbTableName, orderBy: ProductFields.title);

    return products.isNotEmpty
      ? products.map((pr) => Product.fromJson(pr)).toList()
        : []; 
  }

  Future<int> add(Product product) async {
    final db = await instanse.database;

    return await db.insert(DBStrings.dbTableName, product.toJson());
  }

  Future<int> remove(int id) async {
    final db = await instanse.database;

    return await db.delete(DBStrings.dbTableName, where: "${ProductFields.id} = ?", whereArgs: [id]);
  }

  Future<int> update(Product product) async {
    final db = await instanse.database;

    return await db.update(DBStrings.dbTableName, product.toJson(), where: "${ProductFields.id} = ?", whereArgs: [product.id]);
  }

  Future close() async {
    final db = await instanse.database;

    db.close();
  } 

}