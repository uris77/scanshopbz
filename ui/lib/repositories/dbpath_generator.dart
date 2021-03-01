import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Generates the dbpath where the database will be stored.
class DbpathGenerator {
  /// Constructor
  DbpathGenerator(String dbFilename) {
    getApplicationDocumentsDirectory().then((appDocumentDir) {
      // final dbFilename = 'scanshopbz_demo';
      _dbPath = join(appDocumentDir.path, dbFilename);
    });
  }

  /// The path where the database is stored.
  String dbpath;

  /// sets the dbpath
  set _dbPath(String name) {
    dbpath = name;
  }
}
