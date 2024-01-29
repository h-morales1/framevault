import 'package:frame_vault/db/db_handler.dart';
import 'package:frame_vault/product/product.dart';
import 'package:test/test.dart';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

@Skip('not yet fully implemented')
Future main() async {
  late Database database;
  //final dbh = await DbHandler.db();
  // Setup sqflite_common_ffi for flutter test
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for SQFlite
    databaseFactory = databaseFactoryFfi;

  });


  test('table existence', () async {
    //final dbh = await DbHandler.db();
    //final data = await DbHandler.getProducts();
    //expect(data.isEmpty, true);
  });

  /*test('adding new product', () async {
    Product? prod = Product();
    prod.name = "Test name";
    prod.medium = "oil";
    prod.purchasePrice = "20";
    prod.height = "2";
    prod.width = "333";
    prod.depth = "4";
    prod.location = "sycamore";
    prod.purchaseDate = "01/01/01";
    prod.note = "none";
    prod.framed = "true";
    prod.sold = "true";
    prod.picturePath = "test";
    prod.creationDate = "01/01/90";
    prod.onWebStore = "false";
    prod.categories = "none";
    final prodId = await DbHandler.createProduct(prod);
    expect(prodId, 1);

    //final dbh = await DbHandler.db();
    //String sql = """DELETE FROM products """;
    //dbh.execute(sql);
  });*/



}