import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';

main() {
  test('sample', () {
    final dao = ProductsDao(databaseFile: 'sample_db');
    expect(1, equals(1));
  });
}
