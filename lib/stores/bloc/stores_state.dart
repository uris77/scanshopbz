part of 'stores_bloc.dart';

/// The state for the StoresBloc
@immutable
abstract class StoresState extends Equatable {
  /// Constructs an empty StoresState
  const StoresState();

  @override
  List<Object> get props => [];
}

/// State that indicates that Stores are being loaded.
class StoresLoadInProgress extends StoresState {}

/// State that indicates that stores were loaded successfully.
class StoresLoadSuccess extends StoresState {
  /// Constructs a state that indicates that stores were loaded successfully.
  const StoresLoadSuccess([this.stores = const []]);

  /// Stores that were loaded.
  final List<Store> stores;

  @override
  List<Object> get props => [stores];
}

/// State that indicates that a store is being saved
class StoresSavingInProgress extends StoresState {
  /// constructs a state that indicates that a store is being saved.
  const StoresSavingInProgress(this.store);

  /// Store that is being saved
  final Store store;

  @override
  List<Object> get props => [store];
}

/// State that indicates that a store was successfully saved.
class StoresSavedSuccessfully extends StoresState {
  /// Constructor
  const StoresSavedSuccessfully(this.store);

  /// Store that was saved
  final Store store;

  @override
  List<Object> get props => [store];
}

/// State that indicates when a store failed to save.
class StoreFailedToSave extends StoresState {
  /// Constructor
  const StoreFailedToSave(this.store);

  /// Store that failed to save.
  final Store store;

  @override
  List<Object> get props => [store];
}

/// State that indicates failure while loading stores.
class StoresLoadFailure extends StoresState {}
