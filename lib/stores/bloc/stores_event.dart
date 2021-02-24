part of 'stores_bloc.dart';

/// The Bloc Events for Stores
@immutable
abstract class StoresEvent extends Equatable {
  /// Constructor
  const StoresEvent();

  @override
  List<Object> get props => [];
}

/// The event for loading stores
class LoadStores extends StoresEvent {
  @override
  List<Object> get props => [];
}

/// The event for adding a store
class AddStore extends StoresEvent {
  /// Constructor
  const AddStore(this.store);

  /// The store to add.
  final Store store;

  @override
  List<Object> get props => [store];
}

/// The event for updating a store.
class UpdateStore extends StoresEvent {
  /// Constructor
  const UpdateStore(this.store);

  /// The store to update
  final Store store;

  @override
  List<Object> get props => [store];
}
