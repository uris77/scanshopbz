import 'dart:async';

import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast_db/sembast_db.dart';

/// The Products DAO, used for interacting with the database.
class ProductsDao extends Dao<Product> {
  /// Constructor
  ProductsDao({required this.databaseFile});

  /// The name of the collection for storing products.
  static const String productStoreName = 'products';

  /// The file name used for the dao's database.
  final String databaseFile;

  // This store acts like a persistent map, where its Product objects are
  //converted to a Map
  final _productStore = intMapStoreFactory.store(productStoreName);

  // Private getter to shorten the amount of coded needed to get the singleton
  // instance of an opened database
  Future<Database> get _db async {
    if (databaseFile == 'memory') {
      var factory = databaseFactoryMemory;
      return await factory.openDatabase(databaseFile);
    }
    return await AppDatabase.instance(databaseFile).database;
  }

  /// Persists a product
  @override
  Future<void> insert(Product product) async {
    await _productStore.add(await _db, product.toJson());
  }

  /// Updates a product
  @override
  Future update(Product product) async {
    final finder = Finder(filter: Filter.byKey(product.id));
    return await _productStore.update(await _db, product.toJson(),
        finder: finder);
  }

  @override
  Future delete(Product entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _productStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<Product>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final snapshots = await (_productStore.find(await _db, finder: finder));
    return snapshots.map((snapshot) {
      final product = Product.fromJson(snapshot.value);
      return product;
    }).toList();
  }

  /// Counts all products by category
  Future<Map<String, int>> countByAllCategories() async {
    var counts = <String, int>{};
    await for (var snapshot in _productStore.stream(await _db)) {
      var product = Product.fromJson(snapshot.value);
      counts[product.category.name] = (counts[product.category.name] ?? 0) + 1;
    }
    return counts;
  }

  /// Counts the number of products for a particular category.
  Future<int> countByCategory(String categoryName) async {
    final filter = Filter.equals('category.name', categoryName);
    return await _productStore.count(await _db, filter: filter);
  }

  /// Gets a product with the given name
  Future<Product?> getByName(String name) async {
    final filter = Filter.equals('name', name);
    final finder = Finder(filter: filter);
    final snapshot = await (_productStore.findFirst(await _db, finder: finder));
    final product = snapshot == null ? null : Product.fromJson(snapshot.value);
    return product;
  }

  @override
  Future<void> clear() async {
    await _productStore.delete(await _db);
  }
}
