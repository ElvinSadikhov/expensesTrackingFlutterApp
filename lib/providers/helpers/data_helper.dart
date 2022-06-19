import 'dart:async';

import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart'; 

class DataHelper { 

  // TODO: to figure it out

  static final DataHelper instanse = DataHelper._init();

  static Database? _database;

  DataHelper();
  DataHelper._init();
  

  Future<Database> getDatabase(String fileName) async { 
    if(_database != null) return _database!;

    _database = await _initDB(fileName);
    
    return _database!; 
  }

  Future<Database> _initDB(String filePath) async {   
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  set database(Database? db) => _database = db; 

  FutureOr<void> _createDB(Database db, int version) {
  }
}