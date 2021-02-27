import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';
import 'package:test/test.dart';

// ignore: always_declare_return_types
main() {
  final dao = ProductsDao(databaseFile: 'memory');
  var beverageCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'beverages');
  var dairyCategory = productCategories
      .firstWhere((element) => element.name.toLowerCase() == 'dairy');
  var fruitsVegsCategory = productCategories.firstWhere(
      (element) => element.name.toLowerCase() == 'fruits & vegetables');
  group('Products Dao', () {
    test('should persist a product', () async {
      final product = Product(name: 'Tea', category: beverageCategory);
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
          Product(name: 'coke', category: beverageCategory),
          Product(name: 'coffee', category: beverageCategory),
          Product(name: 'beer', category: beverageCategory),
          Product(name: 'orange juice', category: beverageCategory),
        ];
        final dairy = [
          Product(name: 'milk', category: dairyCategory),
          Product(name: 'Parmesan Cheese', category: dairyCategory),
        ];
        final fruitsAndVegetables = [
          Product(name: 'grapes', category: fruitsVegsCategory),
          Product(name: 'sweet pepper', category: fruitsVegsCategory),
          Product(name: 'apple', category: fruitsVegsCategory),
          Product(name: 'carrots', category: fruitsVegsCategory),
          Product(name: 'red kidney beans', category: fruitsVegsCategory),
          Product(name: 'onions', category: fruitsVegsCategory),
          Product(name: 'white rice', category: fruitsVegsCategory),
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
