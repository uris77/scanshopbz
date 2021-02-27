import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';

// ignore: always_declare_return_types
main() {
  final dao = ProductsDao(databaseFile: 'memory');
  group('Products Dao', () {
    test('should persist a product', () async {
      var beverages = productCategories
          .firstWhere((element) => element.name.toLowerCase() == 'beverages');
      final product = Product(name: 'Tea', category: beverages);
      await dao.insert(product);
      final products = await dao.getAllSortedByName();
      final teas = products
          .where((element) => element.name.toLowerCase() == 'tea')
          .toList();
      expect(teas.isNotEmpty, isTrue);
      expect(teas.length, equals(1));
    });
  });
}
