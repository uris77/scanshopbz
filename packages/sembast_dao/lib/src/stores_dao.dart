import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_db/sembast_db.dart';

class StoresDao extends Dao<Store> {
  static const String storeName = 'stores';

  // This store acts like a persistent map, where its Store objects
  // are converted to a Map
  final _storeStore = intMapStoreFactory.store(storeName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  @override
  Future<void> delete(Store entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    await _storeStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<Store>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final snapshots = await _storeStore.find(await _db, finder: finder);
    return snapshots.map((snapshot) {
      final store = Store.fromJson(snapshot.value);
      store.id = snapshot.key;
      return store;
    }).toList();
  }

  @override
  Future<void> insert(Store entity) async {
    await _storeStore.add(await _db, entity.toJson());
  }

  @override
  Future<void> update(Store entity) async {
    final finder = Finder(filter: Filter.byKey(entity.id));
    return await _storeStore.update(await _db, entity.toJson(), finder: finder);
  }
}
