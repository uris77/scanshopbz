import 'package:flutter_test/flutter_test.dart';
import 'package:scanshop_models/models.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  test('Fruit Dao', () async {
    final mango = Fruit(name: 'mango', isSweet: false);
    // final FruitDao fruitDao = FruitDao();
    // await fruitDao.insert(mango);
    // final fruits = await fruitDao.getAllSortedByName();
    // expect(fruits.length, 1);
    final json = mango.toJson();
    final ext = Fruit.fromJson(json);
    expect(ext, null);
  });

  test('Products', () {
    const category = ProductCategory(name: 'Beverages');
    final product = Product(
        name: 'Coffee',
        description: 'Some Coffee',
        manufacturer: 'Nescafe',
        category: category);
    expect(product.category, category);
    final json = product.toJson();
    // expect(json, null);
    print('json: $json');
    final ext = Product.fromJson(json);
    expect(ext, null);
  });
}
