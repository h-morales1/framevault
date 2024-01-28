import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:frame_vault/product/product.dart';

class DbHandler {
  //

  static Future<void> createTables(sql.Database database) async {
    const sqlCommand = """CREATE TABLE products(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    medium TEXT,
    purchasePrice TEXT,
    height TEXT,
    width TEXT,
    depth TEXT,
    location TEXT,
    purchaseDate TEXT,
    note TEXT,
    framed TEXT,
    sold TEXT,
    picturePath TEXT,
    creationDate TEXT,
    isOnWebStore TEXT,
    categories TEXT
    ) """;
    await database.execute(sqlCommand);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'products.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Map<String, dynamic> prodToMap(Product prod) {
    final conversion =  {'name': prod.name, 'medium': prod.medium,
      'purchasePrice': prod.purchasePrice, 'height': prod.height, 'width': prod.width,
    'depth': prod.depth, 'location': prod.location, 'purchaseDate': prod.purchaseDate,
    'note': prod.note, 'framed': prod.framed, 'sold': prod.sold, 'picturePath': prod.picturePath,
    'creationDate': prod.creationDate, 'isOnWebStore': prod.onWebStore, 'categories': prod.categories};

    return conversion;
  }

  static Future<int> createProduct(Product prod) async {
    final db = await DbHandler.db();

    /*final data = {'name': prod.name, 'medium': prod.medium,
      'purchasePrice': prod.purchasePrice, 'height': prod.height, 'width': prod.width,
    'depth': prod.depth, 'location': prod.location, 'purchaseDate': prod.purchaseDate,
    'note': prod.note, 'framed': prod.framed, 'sold': prod.sold, 'picturePath': prod.picturePath,
    'creationDate': prod.creationDate, 'isOnWebStore': prod.onWebStore, 'categories': prod.categories};*/

    final id = await db.insert('products', prodToMap(prod),
    conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await DbHandler.db();
    return db.query('products', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getProduct(int id) async {
    final db = await DbHandler.db();
    return db.query('products', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateProduct(Product prod) async {
    final db = await DbHandler.db();
    int id = int.parse(prod.id!);

    final result =
        await db.update('products', prodToMap(prod), where: "id = ?" , whereArgs: [id]);
    return result;
  }

  static Future<void> deleteProduct(Product prod) async {
    final db = await DbHandler.db();

    int id = int.parse(prod.id!);

    try {
      await db.delete("products", where: "id = ?", whereArgs: [id]);
    } catch (error) {
      debugPrint("Error during product deletion: $error");
    }
  }
}