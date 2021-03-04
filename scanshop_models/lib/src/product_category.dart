import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

/// The categories of the products
@freezed
class ProductCategory with _$ProductCategory {
  /// Constructor
  @JsonSerializable(explicitToJson: true)
  const factory ProductCategory({required String name}) = _ProductCategory;

  /// Converts to ProductCategory from json
  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}

/// the list of product categories available.
const productCategories = [
  /// coffee/tea, juice, soda, alcohol...
  ProductCategory(name: 'Beverages'),

  /// flour, baking powder, etc.
  ProductCategory(name: 'Baking Supplies'),

  /// sandwich loaves, bread, bagels, tortillas
  ProductCategory(name: 'Bread & Bakery'),

  /// black pepper, cummin, etc.
  ProductCategory(name: 'Condiments & Sauces'),

  /// milk, cheese, etc.
  ProductCategory(name: 'Dairy'),

  /// ice cream, candy, chewing gum, etc.
  ProductCategory(name: 'Desserts & Sweets'),

  /// cereals, sugar, pasta, mixes, etc.
  ProductCategory(name: 'Dry Goods'),

  /// apples, bananas, cucumber, etc.
  ProductCategory(name: 'Fruits & Vegetables'),

  /// poultry, pork, salmon, etc.
  ProductCategory(name: 'Meats & Seafoods'),

  /// any pre-packaged meal
  ProductCategory(name: 'Prepared Foods'),

  /// laundry, detergent, dishwashing liquid, etc.
  ProductCategory(name: 'Cleaners'),

  /// toilet paper, paper towels, sandwich bags, etc.
  ProductCategory(name: 'Paper Goods'),

  /// shampoo, soap, shaving cream, etc.
  ProductCategory(name: 'Personal Care'),

  /// pet food, pet toys, etc.
  ProductCategory(name: 'Pet Items'),
];
