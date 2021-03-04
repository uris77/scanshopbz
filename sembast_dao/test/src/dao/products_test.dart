import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

// ignore: always_declare_return_types
main() {
  final dao = ProductsDao(databaseFile: 'memory');
  var beverageCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'beverages');
  var dairyCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'dairy');
  var fruitsVegsCategory = productCategories.firstWhere(
      (element) => element.name.toLowerCase() == 'fruits & vegetables');
  var uuid = const Uuid();

  group('Products Dao', () {
    test('should persist a product', () async {
      final product =
          Product(id: uuid.v1(), name: 'Tea', category: beverageCategory);
      await dao.insert(product);
      final products = await dao.getAllSortedByName();
      final teas = products
          .where((element) => element.name.toLowerCase() == 'tea')
          .toList();
      expect(teas.isNotEmpty, isTrue);
      expect(teas.length, equals(1));
    });
    group('counting by category', () {
      setUpAll(() async {
        // Create some product fixtures
        final beverages = [
          Product(id: uuid.v1(), name: 'coke', category: beverageCategory),
          Product(id: uuid.v1(), name: 'coffee', category: beverageCategory),
          Product(id: uuid.v1(), name: 'beer', category: beverageCategory),
          Product(
              id: uuid.v1(), name: 'orange juice', category: beverageCategory),
        ];
        final dairy = [
          Product(id: uuid.v1(), name: 'milk', category: dairyCategory),
          Product(
              id: uuid.v1(), name: 'Parmesan Cheese', category: dairyCategory),
        ];
        final fruitsAndVegetables = [
          Product(id: uuid.v1(), name: 'grapes', category: fruitsVegsCategory),
          Product(
              id: uuid.v1(),
              name: 'sweet pepper',
              category: fruitsVegsCategory),
          Product(id: uuid.v1(), name: 'apple', category: fruitsVegsCategory),
          Product(id: uuid.v1(), name: 'carrots', category: fruitsVegsCategory),
          Product(
              id: uuid.v1(),
              name: 'red kidney beans',
              category: fruitsVegsCategory),
          Product(id: uuid.v1(), name: 'onions', category: fruitsVegsCategory),
          Product(
              id: uuid.v1(), name: 'white rice', category: fruitsVegsCategory),
        ];

        // Save all the products
        for (var beverage in beverages) {
          await dao.insert(beverage);
        }
        // Save all the dairy
        for (var dairyItem in dairy) {
          await dao.insert(dairyItem);
        }
        // Save all fruits & veggies
        for (var fruitVeg in fruitsAndVegetables) {
          await dao.insert(fruitVeg);
        }
      });
      test('should count products by category', () async {
        var countsByCategory = await dao.countByAllCategories();
        expect(countsByCategory[fruitsVegsCategory.name], equals(7));
        expect(countsByCategory[dairyCategory.name], equals(2));
        expect(
            countsByCategory[beverageCategory.name], greaterThanOrEqualTo(4));
      });
      test('should count products by selected category', () async {
        var totalDairy = await dao.countByCategory('Dairy');
        expect(totalDairy, equals(2));
      });
    });
  });
}
