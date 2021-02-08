import 'dart:async';

import './entity.dart';

abstract class Dao<T extends Entity> {
  Future<void> insert(T entity);
  Future<void> update(T entity);
  Future<void> delete(T entity);
  Future<List<T>> getAllSortedByName();
}
