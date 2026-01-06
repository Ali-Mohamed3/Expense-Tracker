import 'dart:developer';

import 'package:expense_tracker/Models/item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TransactionController {
  static Database? _db;
  Future<Database?> get db async {
    _db ??= await initialDb();
    return _db;
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'expense.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "expenses" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    'name' TEXT NOT NULL,
    price REAL NOT NULL,
    category TEXT NOT NULL,
    month TEXT NOT NULL
  )

''');
    print("Create database");
  }

  Future<List<ItemModel>> readData(String sql) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.rawQuery(sql);
    List<ItemModel> data = response
        .map((item) => ItemModel.fromJson(item))
        .toList();
    return data;
  }

  Future<int> insertData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawInsert(sql);
    print("inserted data");
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDb = await db;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    try {
      Database? myDb = await db;
      int response = await myDb!.rawDelete(sql);
      return response;
    } catch (e) {
      log(e.toString());
      return 0;
    }
  }

  Future<int> deleteAll() async {
    Database? myDb = await db;
    int response = await myDb!.delete('expenses');
    return response;
  }
}
