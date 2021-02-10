import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

/// The categories of the products
@JsonSerializable(nullable: false)
class ProductCategory {
  /// constructs a product category
  const ProductCategory({this.name});

  /// Create a ProductCategory from a JSON object.
  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  /// the name of the product category.
  final String name;

  /// convert a product category to a JSON object.
  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
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
