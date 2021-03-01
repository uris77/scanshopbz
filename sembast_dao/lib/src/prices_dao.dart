import 'dart:async';

import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast_db/sembast_db.dart';

/// The Prices DAO, used for interacting with the database.
class PricesDao extends Dao<Price>
    implements PriceQuery<Product, Price, Store> {
  /// Constructor
  PricesDao({@required this.databaseFile});

  /// The name of the prices collection.
  static const String pricesStoreName = 'prices';

  /// This store acts like a persistent map, where its Price objects are
  /// converted to a map.
  final _pricesStore = intMapStoreFactory.store(pricesStoreName);

  /// The file name used for the dao's database.
  final String databaseFile;

  /// Private getter to shorten the amount of code needed to get the singleton
  /// instance of an opened database.
  Future<Database> get _db async {
    if (databaseFile == 'memory') {
      var factory = databaseFactoryMemory;
      return await factory.openDatabase(databaseFile);
    }
    return await AppDatabase.instance(databaseFile).database;
  }

  @override
  Future<void> delete(Price entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _pricesStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<Price>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name.product.name')]);
    final snapshots = await _pricesStore.find(await _db, finder: finder);
    return snapshots.map(_snapshotToPrice).toList();
  }

  @override
  Future<void> insert(Price entity) async {
    await _pricesStore.add(await _db, entity.toJson());
  }

  @override
  Future<void> update(Price entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _pricesStore.update(await _db, entity.toJson(), finder: finder);
  }

  /// retrieves prices for the specified product
  @override
  Future<List<Price>> getAllForProduct(Product product) async {
    final finder = Finder(filter: Filter.equals('product.name', product.name));
    final snapshots = await _pricesStore.find(await _db, finder: finder);
    return snapshots.map(_snapshotToPrice).toList();
  }

  /// Retrieves all prices at a store.
  @override
  Future<List<Price>> getAllPricesAtStore(Store store) async {
    final finder = Finder(filter: Filter.equals('store.id', store.id));
    final snapshots = await _pricesStore.find(await _db, finder: finder);
    return snapshots.map(_snapshotToPrice).toList();
  }

  /// Gets all prices for a specified category
  Future<List<Price>> getAllPricesByCategory(ProductCategory category) async {
    final finder =
        Finder(filter: Filter.equals('product.category.name', category.name));
    final snapshots = await _pricesStore.find(await _db, finder: finder);
    return snapshots.map(_snapshotToPrice).toList();
  }

  /// Gets all prices by store and category
  Future<List<Price>> getAllPricesByStoreAndCategory(
      Store store, ProductCategory category) async {
    final filter = Filter.and([
      Filter.equals('store.id', store.id),
      Filter.equals('product.category.name', category.name)
    ]);
    final snapshots =
        await _pricesStore.find(await _db, finder: Finder(filter: filter));
    return snapshots.map(_snapshotToPrice).toList();
  }

  Price _snapshotToPrice(RecordSnapshot<int, Map<String, dynamic>> snapshot) {
    return Price.fromJson(snapshot.value);
  }

  @override
  Future<void> clear() async {
    await _pricesStore.delete(await _db);
  }
}
