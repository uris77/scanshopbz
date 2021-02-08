import 'package:flutter_test/flutter_test.dart';
import 'package:scanshop_models/models.dart';
import 'package:sembast_dao/sembast_dao.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  test('Fruit Dao', () async {
    final mango = Fruit(name: 'mango', isSweet: false);
    final FruitDao fruitDao = FruitDao();
    await fruitDao.insert(mango);
    final fruits = await fruitDao.getAllSortedByName();
    expect(fruits.length, 1);
    expect(mango, null);
  });
}
