import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

/// The Sembast Database Interface
class AppDatabase {
  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  AppDatabase._();

  // Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  /// The name of the file where the database contents are stored
  static final String fileName = 'scanshopbz_demo.db';

  /// Singleton accessor for an instance of the database
  static AppDatabase get instance => _singleton;

  //Completer is used for transforming synchronous code into async code
  Completer<Database> _dbOpenCompleter;

  Future _openDatabase() async {
    // platform-specific directory where persistent app data can be stored.
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-director/demo.db
    final dbPath = join(appDocumentDir.path, fileName);

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }

  /// Database object accessor
  Future<Database> get database async {
    // Database isn't open yet.
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      await _openDatabase();
    }

    return _dbOpenCompleter.future;
  }
}
