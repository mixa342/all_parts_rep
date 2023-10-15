import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collection/collection.dart';

class DBProvider {
  static final DBProvider db= DBProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  initDB() async {
    Directory documentDirectory = await getApplicationSupportDirectory ();
    String path = join (documentDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db){},
    onCreate: (Database db, int version ) async{
      await db.execute ("CREATE TABLE MY_LIST ("
      "id INTEGER PRIMARY KEY,"
      "title TEXT,"
      "description TEXT"
      ")");
    });
  }
}