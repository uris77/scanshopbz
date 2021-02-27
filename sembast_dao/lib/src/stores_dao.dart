import 'package:meta/meta.dart';
import 'package:scanshop_api/api.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_db/sembast_db.dart';

/// Dao for interacting with persisted stores.
class StoresDao extends Dao<Store> {
  /// constructor
  StoresDao({@required this.databaseFile});

  /// The collection name for stores.
  static const String storeName = 'stores';

  /// The file name used for the dao's database.
  final String databaseFile;

  // This store acts like a persistent map, where its Store objects
  // are converted to a Map
  final _storeStore = intMapStoreFactory.store(storeName);

  Future<Database> get _db async =>
      await AppDatabase.instance(databaseFile).database;

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
