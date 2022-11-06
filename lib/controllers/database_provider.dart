import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/products.dart';

class ProductDBHelper {
  ProductDBHelper._();

  static final ProductDBHelper productDBHelper = ProductDBHelper._();

  String tableName = "product";

  String colId = "id";
  String colName = "name";
  String colPrice = "price";
  String colImage = "image";
  String colQuantity = "quantity";
  String colDummyPrice = "price2";
  String colIsLike = "isLike";

  Database? db;

  // Todo: initDB
  Future<Database> initDatabase() async {
    var db = await openDatabase("myDb.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "myDB.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colPrice REAL,$colQuantity INTEGER,$colDummyPrice REAL,$colImage BLOB,$colIsLike TEXT);");
      },
    );
    return db;
  }

// Todo: insertData
  Future<int> insertData({required Product data}) async {
    db = await initDatabase();

    String query = "INSERT INTO $tableName VALUES (?, ?, ?, ?, ?, ?,?);";
    List arg = [
      data.id,
      data.name,
      data.price,
      data.quantity,
      data.price2,
      data.image,
      data.isLike,
    ];

    return await db!.rawInsert(query, arg);
  }

// Todo: updateData

// Todo: fetchAllData
  Future<List<Product>> fetchAllData() async {
    db = await initDatabase();

    String query = "SELECT * FROM $tableName";

    List<Map<String, Object?>> res = await db!.rawQuery(query);

    log(res.toString(), name: "res");

    List<Product> productData =
        res.map((e) => Product.fromMap(data: e)).toList();

    return productData;
  }

  Future<int> deleteAllData() async {
    db = await initDatabase();

    String query = "DELETE FROM $tableName";

    return await db!.rawDelete(query);
  }
}
