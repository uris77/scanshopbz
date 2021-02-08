/// Classification and categorization of products.
enum ProductCategory {
  /// coffee/tea, juice, soda, alcohol...
  beverages,

  /// flour, baking powder, etc.
  bakingSupplies,

  /// sandwich loaves, bread, bagels, tortillas
  breadBakery,

  /// black pepper, cummin, etc.
  condimentsSauces,

  /// milk, cheese, etc.
  dairy,

  /// ice cream, candy, chewing gum, etc.
  dessertsSweets,

  /// cereals, sugar, pasta, mixes, etc.
  dryGoods,

  /// apples, bananas, cucumber, etc.
  fruitVegetables,

  /// poultry, pork, salmon, etc.
  meatsSeafoods,

  /// any pre-packaged meal
  preparedFoods,

  /// laundry, detergent, dishwashing liquid, etc.
  cleaners,

  /// toilet paper, paper towels, sandwich bags, etc.
  paperGoods,

  /// shampoo, soap, shaving cream, etc.
  personalCare,

  /// pet food, pet toys, etc.
  petItems
}

/// Adds utility methods to the ProductCategory enum.
extension Stringer on ProductCategory {
  /// converts a ProductCategory to a string.
  /// Returns an empty string for invalid product categories.
  String string() {
    switch (this) {
      case ProductCategory.beverages:
        return 'Beverages';
      case ProductCategory.bakingSupplies:
        return 'Baking Supplies';
      case ProductCategory.breadBakery:
        return 'Bread Baker';
      case ProductCategory.condimentsSauces:
        return 'Condiments & Sauces';
      case ProductCategory.dairy:
        return 'Dairy';
      case ProductCategory.dessertsSweets:
        return 'Desserts & Sweets';
      case ProductCategory.dryGoods:
        return 'Dry Goods';
      case ProductCategory.fruitVegetables:
        return 'Fruits & Vegetables';
      case ProductCategory.meatsSeafoods:
        return 'Meets & Seafoods';
      case ProductCategory.preparedFoods:
        return 'Prepared Foods';
      case ProductCategory.cleaners:
        return 'Cleaners';
      case ProductCategory.paperGoods:
        return 'Paper Goods';
      case ProductCategory.personalCare:
        return 'Personal Care';
      case ProductCategory.petItems:
        return 'Pet Items';
      default:
        return '';
    }
  }
}
