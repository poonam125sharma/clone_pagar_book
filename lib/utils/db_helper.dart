import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseHelper {

  static final _dbName = 'pagarbook_database.db';
  static final _dbVersion = 1;

  DatabaseHelper._();                                             // To make it a singleton class
  static final DatabaseHelper instance = DatabaseHelper._();      // Making the instance of this class
	static Database _database;                                      // Making the database

  // Getter
  Future<Database> get database async {
    // For the first time, when the application will be opened first time or installed, _database will be null
    if(_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB () async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db,version) async {
        await db.execute(
          "CREATE TABLE tblemployer(employerId INTEGER PRIMARY KEY, lang TEXT, mobile INTEGER, name TEXT, rDate TEXT, uDate TEXT)"
        );
        await db.execute(
          "CREATE TABLE tblbusiness_details(businessId INTEGER PRIMARY KEY, employerId INTEGER, businessName TEXT, rDate TEXT, uDate TEXT)"
        );
      },
      version: _dbVersion
    );
  }

  Future<void> deleteDB() async {
    var path = join(await getDatabasesPath(), _dbName);
    // Close the opened 
    await ((await openDatabase(path)).close());
    // Delete the database
    await deleteDatabase(path);
  }
}