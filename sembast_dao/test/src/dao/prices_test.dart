// ignore: always_declare_return_types
import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

// ignore: always_declare_return_types
main() {
  final productsDao = ProductsDao(databaseFile: 'memory');
  final pricesDao = PricesDao(databaseFile: 'memory');
  final storesDao = StoresDao(databaseFile: 'memory');
  var beverageCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'beverages');
  var uuid = Uuid();

  group('Prices', () {
    setUpAll(() async {
      // Create some product fixtures
      final beverages = [
        Product(id: uuid.v1(), name: 'tea', category: beverageCategory),
        Product(id: uuid.v1(), name: 'coke', category: beverageCategory),
        Product(id: uuid.v1(), name: 'coffee', category: beverageCategory),
        Product(id: uuid.v1(), name: 'beer', category: beverageCategory),
        Product(
            id: uuid.v1(), name: 'orange juice', category: beverageCategory),
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
        var id = uuid.v1();
        // Create and persist a store
        final storeName = '100 Store';
        await storesDao.insert(Store(id: id, name: storeName));
        var store = await storesDao.getByName(storeName);
        expect(store.name, equals(storeName));
        expect(store.id, isNotNull);

        // Create a prices for some beverages
        final products = await productsDao.getAllSortedByName();
        for (var product in products) {
          final price = Price(
              id: uuid.v1(),
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
        final store = await storesDao.getByName('100 Store');
        final prices = await pricesDao.getAllPricesByStoreAndCategory(
            store, beverageCategory);
        final stores = <String>{};
        for (var price in prices) {
          stores.add(price.store.id);
        }

        expect(prices.length, equals(5));
        expect(stores.length, equals(1),
            reason: 'all prices should belong to one store');
        expect(stores.first, equals(store.id),
            reason: 'the store does not match the expected one');
      });
    });
  });
}
