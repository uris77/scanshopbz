import 'dart:async';

import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_db/sembast_db.dart';

class FruitDao extends Dao<Fruit> {
  static const String fruitStoreName = 'fruits';
  // This store acts like a persistent map, where its Fruit objects are
  //converted to a Map
  final _fruitStore = intMapStoreFactory.store(fruitStoreName);

  // Private getter to shorten the amount of coded needed to get the singleton
  // instance of an opened database
  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<void> insert(Fruit fruit) async {
    await _fruitStore.add(await _db, fruit.toJson());
  }

  @override
  Future update(Fruit fruit) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder
    final finder = Finder(filter: Filter.byKey(fruit.id));
    return await _fruitStore.update(
      await _db,
      fruit.toJson(),
      finder: finder,
    );
  }

  @override
  Future delete(Fruit fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.delete(
      await _db,
      finder: finder,
    );
  }

  @override
  Future<List<Fruit>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);

    final recordSnapshots = await _fruitStore.find(await _db, finder: finder);

    return recordSnapshots.map((snapshot) {
      final fruit = Fruit.fromJson(snapshot.value);
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }
}
