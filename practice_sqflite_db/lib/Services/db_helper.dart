import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const dbName = "myDatabase.db";
  static const dbVersion = 1;
  static const dbTable = "myTable";
  static const columnId = 'id';
  static const columnName = "name";
//constructor
  static final DatabaseHelper instance = DatabaseHelper();

//databse initialise

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
    // return _database;

    // _database = await initDB();
    // return _database;
  }

  initDB() async {
    //intialise database make directory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
    // Directory directory = await ();
  }

  Future onCreate(Database db, int version) async {
    db.execute('''
  CREATE TABLE $dbTable(
  $columnId INTEGER PRIMARY KEY,
  $columnName TEXT NOT NULL
)
      ''');
  }

//insert METHOD
  insertRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(dbTable, row);
  }

//for read OR Query method so use future
  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  //for UPDATE
  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = int.tryParse(row[columnId]) ?? 0;
    return await db!
        .update(dbTable, row, where: '$columnId= ?', whereArgs: [id]);
  }

  //DELETE method

  Future<int> deleteRecord(int id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$columnId=?', whereArgs: [id]);
  }
}
