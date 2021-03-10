import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// Generates the dbpath where the database will be stored.
class DbpathGenerator {
  /// Constructor
  DbpathGenerator(String dbFilename) {
    // getApplicationDocumentsDirectory().then((appDocumentDir) {
    //   print('setting dbPath.... ${appDocumentDir.path} + $dbFilename');
    //   _dbPath = join(appDocumentDir.path, dbFilename);
    // });
    _dbFileName = dbFilename;
  }

  String _dbFileName;

  ///
  Future<String> dbPath() async {
    var appDocumentsDir = await getApplicationDocumentsDirectory();
    print('setting dbPath.... ${appDocumentsDir.path} + $_dbFileName');
    var _dbPath = join(appDocumentsDir.path, _dbFileName);
    return _dbPath;
  }
}
