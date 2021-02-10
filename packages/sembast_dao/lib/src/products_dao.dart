import 'dart:async';

import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_db/sembast_db.dart';

class ProductsDao extends Dao<Product> {
  static const String productStoreName = 'products';

  // This store acts like a persistent map, where its Product objects are
  //converted to a Map
  final _productStore = intMapStoreFactory.store(productStoreName);

  // Private getter to shorten the amount of coded needed to get the singleton
  // instance of an opened database
  Future<Database> get _db async => await AppDatabase.instance.database;

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
  Future delete(Product product) async {
    final finder = Finder(filter: Filter.byKey(product.id));
    await _productStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<Product>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final snapshots = await _productStore.find(await _db, finder: finder);
    print('snapshots: $snapshots}');
    return snapshots.map((snapshot) {
      final product = Product.fromJson(snapshot.value);
      product.id = snapshot.key;
      return product;
    }).toList();
  }
}
