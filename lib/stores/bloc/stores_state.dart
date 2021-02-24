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

/// State that indicates failure while loading stores.
class StoresLoadFailure extends StoresState {}
