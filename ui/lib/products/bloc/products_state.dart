part of 'products_bloc.dart';

/// The state for the ProductBloc
@immutable
abstract class ProductsState extends Equatable {
  /// Creates an empty ProductState
  const ProductsState();

  @override
  List<Object> get props => [];
}

/// The state that indicates that products are being loaded.
class ProductsLoadInProgress extends ProductsState {}

/// The state that indicates that products were successfully loaded.
@immutable
class ProductsLoadSuccess extends ProductsState {
  /// Constructs the state that indicates products were loaded successfully.
  const ProductsLoadSuccess([this.products = const []]);

  /// The products that were loaded.
  final List<Product> products;

  @override
  List<Object> get props => [products];
}

/// State that indicates failure while loading products.
class ProductsLoadFailure extends ProductsState {}

/// Indicates that a product was successfully saved.
class ProductSavedSuccessfully extends ProductsState {
  ///Constructor
  const ProductSavedSuccessfully({this.product});

  /// Product that was saved.
  final Product product;

  @override
  List<Object> get props => [product];
}
