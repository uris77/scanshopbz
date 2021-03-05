part of 'prices_bloc.dart';

/// The state for PricesBloc
@immutable
abstract class PricesState extends Equatable {
  /// Constructor
  const PricesState();

  @override
  List<Object> get props => [];
}

/// Indicates when products are being loaded from store
class PricesLoadInProgress extends PricesState {}

/// Indicates when prices were loaded successfully
@immutable
class PricesLoadSuccess extends PricesState {
  /// Constructor
  const PricesLoadSuccess([this.prices = const []]);

  /// The prices that were loaded
  final List<Price> prices;

  @override
  List<Object> get props => [prices];
}

/// Indicates that prices were not loaded due to an error.
class PricesLoadFailure extends PricesState {}
