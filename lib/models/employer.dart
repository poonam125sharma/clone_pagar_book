import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:pagar_book/utils/db_helper.dart';
// import 'package:scoped_model/scoped_model.dart';

class Employer {
  int employerId;
  String lang;
  int mobile;
  String name;
  String rDate;
  String uDate;

  final DatabaseHelper instance = DatabaseHelper.instance;

  static final _tableName = 'tblemployer';

  int get gsEmployerId => employerId;

  String get gsLang => lang;

  int get gsMobile => mobile;

  String get gsName => name;

  String get gsRegDate => rDate;

  String get gsModDate => uDate;

  set gsLang(String newLang) {
    this.lang = newLang;
  }

  set gsMobile(int newMobile) {
    this.mobile = newMobile;
  }

  set gsName(String newName) {
    this.name = newName;
  }

  set gsRegDate(String newRegDate) {
    this.rDate = newRegDate;
  }

  set gsModDate(String newModDate) {
    this.uDate = newModDate;
  }

  Employer({this.employerId, this.lang, this.mobile, this.name, this.rDate, this.uDate});

  Employer.withId(this.employerId, this.lang, this.mobile, this.name, this.rDate, this.uDate);

  // Convert an Employer into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'employerId': employerId,
      'lang': lang,
      'mobile': mobile,
      'name': name,
      'rDate': rDate,
      'uDate': uDate
    };
  }

  Employer.fromMapObject(Map<String,dynamic> map) {    
      this.employerId = map['employerId'];
      this.lang = map['lang'];
      this.mobile = map['mobile'];
      this.name = map['name'];
      this.rDate = map['rDate'];
      this.uDate = map['uDate'];
  }

  // Implement toString to make it easier to see information about
  // each employer when using the print statement.
  @override
  String toString() {
    return 'Employer{lang: $lang, mobile: $mobile, rDate: $rDate, uDate: $uDate}';
  }

  // auto incremented id of the newly inserted record will be returned, that's why Future has a return type of int
  Future<int> insertEmployer(Employer employer) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    return await db.insert(
      _tableName,
      employer.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Employer>> getEmployers() async {
    // Get a reference to the database
    final Database db = await instance.database;

    // Query the table for all the employers
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    // Convert the List<Map<String, dynamic>> into a List<Employer>
    return List.generate(maps.length, (i) {
      return Employer(
        employerId: maps[i]['employerId'],
        lang: maps[i]['lang'],
        mobile: maps[i]['mobile'],
        name: maps[i]['name'],
        rDate: maps[i]['rDate'],
        uDate: maps[i]['uDate']
      );
    });
  }

  // number of rows affected will be returned, that's why Future has a return type of int
  Future<int> updateEmployer(Employer employer) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    // Update the given Employer
    return await db.update(
      _tableName,
      employer.toMap(),
      // Ensure that the Dog has a matching id.
      where: "employerId = ?",
      // Pass the Employer's id as a whereArg to prevent SQL injection.
      whereArgs: [employer.employerId]
    );
  }

  Future<void> deleteEmployer(int employerId) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    // Remove the employer from the database
    await db.delete(
      _tableName,
      // Use a `where` clause to delete a specific employer.
      where: "employerId = ?",
      // Pass the Employer's id as a whereArg to prevent SQL injection.
      whereArgs: [employerId],
    );
  }
}