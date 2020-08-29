import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:pagar_book/utils/db_helper.dart';

class BusinessDetails {
  int businessId;
  int employerId;
  String businessName;
  String rDate;
  String uDate;

  final DatabaseHelper instance = DatabaseHelper.instance;

  static final _tableName = 'tblbusiness_details';

  int get gsBusinessId => businessId;

  int get gsEmployerId => employerId;

  String get gsbusinessName => businessName;

  String get gsRegDate => rDate;

  String get gsModDate => uDate;

  set gsBusinessName(String newBusinessName) {
    this.businessName = newBusinessName;
  }

  set gsRegDate(String newRegDate) {
    this.rDate = newRegDate;
  }

  set gsModDate(String newModDate) {
    this.uDate = newModDate;
  }

  BusinessDetails({this.businessId, this.employerId, this.businessName, this.rDate, this.uDate});

  BusinessDetails.withId(this.businessId, this.employerId, this.businessName, this.rDate, this.uDate);

  // Convert an Business details into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'businessId': businessId,
      'employerId': employerId,
      'businessName': businessName,
      'rDate': rDate,
      'uDate': uDate
    };
  }

  BusinessDetails.fromMapObject(Map<String,dynamic> map) {    
      this.businessId = map['businessId'];
      this.employerId = map['employerId'];
      this.businessName = map['businessName'];
      this.rDate = map['rDate'];
      this.uDate = map['uDate'];
  }

  // auto incremented id of the newly inserted record will be returned, that's why Future has a return type of int
  Future<int> insertBusinessDetails(BusinessDetails busnsDtl) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    return await db.insert(
      _tableName,
      busnsDtl.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BusinessDetails>> getBusinessDetails() async {
    // Get a reference to the database
    final Database db = await instance.database;

    // Query the table for all the business details
    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    // Convert the List<Map<String, dynamic>> into a List<BusinessDetails>
    return List.generate(maps.length, (i) {
      return BusinessDetails(
        businessId: maps[i]['businessId'],
        employerId: maps[i]['employerId'],
        businessName: maps[i]['businessName'],
        rDate: maps[i]['rDate'],
        uDate: maps[i]['uDate']
      );
    });
  }

  // number of rows affected will be returned, that's why Future has a return type of int
  Future<int> updateBusinessDetails(BusinessDetails busnsDtl) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    // Update the given Business
    return await db.update(
      _tableName,
      busnsDtl.toMap(),
      // Ensure that the business has a matching id.
      where: "businessId = ?",
      // Pass the Business's id as a whereArg to prevent SQL injection.
      whereArgs: [busnsDtl.businessId]
    );
  }

  Future<void> deleteBusinessDetails(int businessId) async {
    // Get a reference to the database.
    final Database db = await instance.database;

    // Remove the business from the database
    await db.delete(
      _tableName,
      // Use a `where` clause to delete a specific business.
      where: "businessId = ?",
      // Pass the Business's id as a whereArg to prevent SQL injection.
      whereArgs: [businessId],
    );
  }
}