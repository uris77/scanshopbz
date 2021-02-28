// ignore: always_declare_return_types
import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';

// ignore: always_declare_return_types
main() {
  final productsDao = ProductsDao(databaseFile: 'memory');
  final pricesDao = PricesDao(databaseFile: 'memory');
  final storesDao = StoresDao(databaseFile: 'memory');
  var beverageCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'beverages');

  group('Prices', () {
    setUpAll(() async {
      // Create some product fixtures
      final beverages = [
        Product(name: 'tea', category: beverageCategory),
        Product(name: 'coke', category: beverageCategory),
        Product(name: 'coffee', category: beverageCategory),
        Product(name: 'beer', category: beverageCategory),
        Product(name: 'orange juice', category: beverageCategory),
      ];

      // Save all the products
      for (var beverage in beverages) {
        await productsDao.insert(beverage);
      }
    });
    group('persistence', () {
      test('should save a product`s price', () async {
        final tea = await productsDao.getByName('tea');
        expect(tea.name, equals('tea'));
        expect(tea.id, isNotNull);

        // assign a price
        await pricesDao.insert(
            Price(product: tea, price: 5.75, timestamp: DateTime.now()));
        final prices = await pricesDao.getAllForProduct(tea);
        expect(prices.length, equals(1));
      });
    });
    group('querying', () {
      test('should query all prices for a product in a store', () async {
        // Create and persist a store
        final storeName = '100 Store';
        await storesDao.insert(Store(name: storeName));
        var store = await storesDao.getByName(storeName);
        expect(store.name, equals(storeName));
        expect(store.id, isNotNull);

        // Create a prices for some beverages
        final products = await productsDao.getAllSortedByName();
        for (var product in products) {
          final price = Price(
              product: product,
              store: store,
              price: 11,
              timestamp: DateTime.now());
          await pricesDao.insert(price);
        }
        final prices = await pricesDao.getAllPricesAtStore(store);
        expect(prices.length, equals(products.length));
      });
      test('should query all prices by category', () async {
        final products =
            await pricesDao.getAllPricesByCategory(beverageCategory);
        expect(products.length, equals(6));
      });
      test('should query all prices by category in a store', () async {
        fail('Not Implemented');
      });
    });
  });
}
