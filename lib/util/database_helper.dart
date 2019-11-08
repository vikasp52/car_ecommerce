import 'dart:async';
import 'dart:io';
import 'package:car_ecommerce/model/car_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper.internal();

  factory DataBaseHelper() => _instance;

  //Contact Table variable
  final String tableCarAd = "CarAdTable";
  final String adIdCol = "adId";
  final String nameCol = "name";
  final String priceCol = "price";
  final String ratingCol = "rating";
  final String colorCol = "color";
  final String carTypeCol = "carType";
  final String brandCol = "brand";
  final String descriptionCol = "description";
  final String imagePathCol = "imagePath";

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  DataBaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "CarAd.db");
    var ourDb = await openDatabase(path, version: 2, onCreate: _onConfigure);
    return ourDb;
  }

  void _onConfigure(Database db, int version) async {
    //Contact Table
    await db.execute("""
    CREATE TABLE $tableCarAd(
    $adIdCol INTEGER PRIMARY KEY AUTOINCREMENT,
    $nameCol TEXT,
    $priceCol TEXT,
    $colorCol TEXT,
    $ratingCol TEXT,
    $carTypeCol TEXT,
    $descriptionCol TEXT,
    $brandCol TEXT,
    $imagePathCol TEXT)
    """);
  }

  // Insertion into Contact
  Future<int> saveAdData(Car item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableCarAd", item.toMap());
    return res;
  }

  //Get Contact data
  Future<List> getContactList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableCarAd");
    print("DataBase Table \n $result");
    return result.toList();
  }

  Future<int> updateContact(Car item) async {
    var dbClient = await db;
    return await dbClient.update("$tableCarAd", item.toMap(),
        where: "$adIdCol = ?", whereArgs: [item.adId]);
  }

  Future<List> getFavouriteContacts(String status) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableCarAd WHERE $descriptionCol = ?", [status]);
    print("Favourite DataBase Table \n $result");
    return result.toList();
  }

  Future<int> updateFavouriteContact({int contactId, String favourite}) async {
    var dbClient = await db;

    return await dbClient.rawUpdate(
        'UPDATE $tableCarAd SET $descriptionCol = ? WHERE $adIdCol = ?',
        [favourite, contactId]);

  }

  //Call this method if Item is deleted from Contact
  Future<int> deleteContactItems(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableCarAd, where: "$adIdCol = ?", whereArgs: [id]);
  }
}
