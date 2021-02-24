part of 'products_bloc.dart';

/// The Bloc Events for Products
@immutable
abstract class ProductsEvent extends Equatable {
  /// Constructor
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

/// The event for loading products
class LoadProducts extends ProductsEvent {
  @override
  List<Object> get props => [];
}

/// The event for adding a product
class AddProduct extends ProductsEvent {
  /// The Constructor
  const AddProduct(this.product);

  /// The product to be added
  final Product product;

  @override
  List<Object> get props => [product];
}

/// The event for updating a product
class UpdateProduct extends ProductsEvent {
  /// Constructor
  const UpdateProduct(this.product);

  /// The product to update
  final Product product;

  @override
  List<Object> get props => [product];
}
