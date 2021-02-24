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
}
