part of 'prices_bloc.dart';

/// Events for the PricesBloc
@immutable
abstract class PricesEvent extends Equatable {
  /// Constructor
  const PricesEvent();

  @override
  List<Object> get props => [];
}

/// Event for loading prices for a product
class LoadPricesForProduct extends PricesEvent {
  /// Constructor
  const LoadPricesForProduct({this.product});

  /// Load the prices for this product.
  final Product product;

  @override
  List<Object> get props => [];
}
