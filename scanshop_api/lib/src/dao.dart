import 'dart:async';

import './entity.dart';

/// DAO for persistent entities
abstract class Dao<T extends Entity> {
  /// Persists and entity
  Future<void> insert(T entity);

  /// Updates an entity
  Future<void> update(T entity);

  /// Deletes an entity
  Future<void> delete(T entity);

  /// Retrieves all entities and sorts them by name.
  Future<List<T>> getAllSortedByName();

  /// Clears all the records in the database.
  Future<void> clear();
}

/// Query features for products
abstract class ProductQuery {
  /// counts the number of products in a category
  Future<int> countByCategory(String categoryName);
}

/// Query features for prices
abstract class PriceQuery<T extends Entity, E extends Entity,
    S extends Entity> {
  /// retrieves prices for the specified product
  Future<List<E>> getAllForProduct(T product);

  /// Retrieves all prices at a store.
  Future<List<E>> getAllPricesAtStore(S store);
}
